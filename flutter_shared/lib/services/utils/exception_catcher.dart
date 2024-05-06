import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_shared/dialog/generic_dialog.dart';
import 'package:flutter_shared/exceptions/data_exceptions.dart';
import 'package:flutter_shared/exceptions/util_exceptions.dart';
import 'package:flutter_shared/services/utils/api_service.dart';
import 'package:flutter_shared/types/user/full_user.dart';
import 'package:flutter_shared/types/utils/exception_report.dart';
import 'package:flutter_shared/utils/app_info_util.dart';
import 'package:flutter_shared/utils/logger.dart';

class ExceptionCatcher {
  static Future<void> generalException(
    BuildContext context,
    dynamic exception,
    StackTrace stackTrace, {
    FullUser? user,
    String? userText,
  }) async {
    if (exception is LostConnectionException) {
      await showErrorDialog(
        context,
        'Lost connection. Please reconnect to the internet and try again.',
      );
    } else if (exception is ApiRequestTimeoutException) {
      _trackApiException(exception, stackTrace);
      await showErrorDialog(
        context,
        'Request timed out to our server. Please try again later or contact support.',
      );
    } else if (exception is UnableToUpdate) {
      _trackApiException(exception, stackTrace);
      await showErrorDialog(
        context,
        userText ?? 'Unable to update. Please try again later.',
      );
    } else if (exception is ApiException) {
      _trackApiException(exception, stackTrace);
      await showErrorDialog(
        context,
        userText ?? 'An unknown error occurred. Please try again later. exception: $exception',
      );
    } else if (exception is CustomSocketException) {
      trackException(
        name: 'SocketException',
        stackTrace: stackTrace,
        error: exception,
      );
      await showErrorDialog(
        context,
        userText ??
            'An unknown Firebase error occurred. Please try again later. exception: ${exception.socketException.message}',
      );
    } else {
      trackException(
        name: exception.runtimeType.toString(),
        additional: exception.toString(),
        userText: userText,
        stackTrace: stackTrace,
      );

      await showErrorDialog(
        context,
        userText ?? 'An unknown error occurred. Please try again later. exception: $exception',
      );
    }
  }

  static Future<void> showErrorDialog(
    BuildContext context,
    String content,
  ) {
    return showGenericDialog<void>(
      context: context,
      title: 'A problem occurred',
      content: content,
      optionsBuilder: () => {'OK': null},
    );
  }

  static Future<void> trackException({
    String? name,
    Exception? error,
    String? additional,
    Object? body,
    String? code,
    String? endpoint,
    required StackTrace stackTrace,
    bool? hasAuth,
    bool log = true,
    String? message,
    String? method,
    Object? params,
    bool send = true,
    FullUser? user,
    String? userText,
    bool warninig = false,
  }) async {
    if (error != null) {
      if (error is ApiException) {
        await _trackApiException(
          error,
          stackTrace,
          log: log,
          send: send,
          warning: warninig,
        );
        return;
      }
      if (error is CustomSocketException) {
        await _trackSocketException(
          error,
          stackTrace,
          log: log,
          send: send,
          warning: warninig,
        );
      }
      return;
    }
    await _normalException(
      name: name ?? 'UnknownException',
      additional: additional,
      body: body,
      code: code,
      endpoint: endpoint,
      stackTrace: stackTrace,
      hasAuth: hasAuth,
      log: log,
      message: message,
      method: method,
      params: params,
      send: send,
      user: user,
      userText: userText,
      warninig: warninig,
    );
  }

  static T typeErrorSerializer<T>(
    T Function() function,
    Object? json,
    StackTrace stackTrace,
  ) {
    T result;
    try {
      result = function();
    } catch (e) {
      logger.i(mapToString(map: json as Map<String, dynamic>));
      trackException(
        name: 'TypeError',
        additional: json.toString(),
        code: e.runtimeType.toString(),
        message: e.toString(),
        stackTrace: stackTrace,
      );
      rethrow;
    }
    return result;
  }

  static Future<void> _normalException({
    String? additional,
    Object? body,
    String? code,
    String? endpoint,
    required StackTrace stackTrace,
    bool? hasAuth,
    bool? isRetry,
    bool log = true,
    String? message,
    String? method,
    required String name,
    Object? params,
    bool send = true,
    int? durationInMs,
    bool warninig = false,
    FullUser? user,
    String? userText,
  }) async {
    FullUser? act = user;
    FullUser? simplified = act == null
        ? null
        : FullUser(id: act.id).copyWith(
            email: act.email,
            phoneNumber: act.phoneNumber,
            firstName: act.firstName,
            lastName: act.lastName,
          );
    ExceptionReport report = ExceptionReport(
      appInfo: AppInfoUtil().appInfo,
      additional: additional,
      body: body,
      code: code,
      endpoint: endpoint,
      hasAuth: hasAuth,
      isRetry: isRetry,
      message: message,
      method: method,
      name: name,
      params: params,
      time: DateTime.now(),
      durationInMs: durationInMs,
      userText: userText,
      user: simplified,
      warning: warninig,
      stackTrace: stackTrace,
    );
    if (log) {
      if (warninig) {
        logger.w(report.toJson());
      } else {
        logger.e(report.toJson());
      }
    }
    if (send) {
      await ApiService.doPost('/api-log/v1/log', report.toJson());
    }
  }

  static Future<void> _trackApiException(
    ApiException apiException,
    StackTrace stackTrace, {
    bool log = true,
    bool send = true,
    bool warning = false,
  }) {
    return _normalException(
      additional: apiException.response?.reasonPhrase,
      body: apiException.body,
      code: apiException.response?.statusCode.toString(),
      endpoint: apiException.endpoint,
      hasAuth: apiException.hasAuth,
      isRetry: apiException.isRetry,
      log: log,
      message: apiException.response?.body,
      method: apiException.method,
      name: 'ApiException',
      params: apiException.params,
      send: send,
      stackTrace: stackTrace,
      durationInMs: apiException.durationInMs,
      warninig: warning,
    );
  }

  static Future<void> _trackSocketException(
    CustomSocketException customSocketException,
    StackTrace stackTrace, {
    bool log = true,
    bool send = true,
    bool warning = false,
  }) async {
    SocketException socketException = customSocketException.socketException;
    return _normalException(
      name: 'SocketException',
      additional: 'host: ${socketException.address?.host}'
          ' - address: ${socketException.address?.address}'
          ' - port: ${socketException.port}'
          ' - type: ${socketException.address?.type.name}'
          ' - isMulticast: ${socketException.address?.isMulticast}'
          ' - isLoopback: ${socketException.address?.isLoopback}'
          ' - isLinkLocal: ${socketException.address?.isLinkLocal}',
      body: customSocketException.body,
      endpoint: customSocketException.endpoint,
      params: customSocketException.params,
      method: customSocketException.method,
      hasAuth: customSocketException.hasAuth,
      isRetry: customSocketException.isRetry,
      code: socketException.osError?.errorCode.toString(),
      message: 'message: ${socketException.message}'
          ' - osErrorMessage: ${socketException.osError?.message}',
      stackTrace: stackTrace,
      log: log,
      send: send,
      durationInMs: customSocketException.durationInMs,
      warninig: warning,
    );
  }
}
