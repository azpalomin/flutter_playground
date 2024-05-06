import 'dart:convert';
import 'dart:io';

import 'package:flutter_shared/exceptions/data_exceptions.dart';
import 'package:flutter_shared/services/utils/device_connectivity_service.dart';
import 'package:flutter_shared/utils/environment.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Future<Map<String, dynamic>> doDelete(
    String url, {
    Object? body,
    bool isRetry = false,
    Map<String, String> params = const {},
    bool requiresAuth = false,
  }) async {
    await DeviceConnectivityService().isOfflineThrow();
    Map<String, String> headers = await _getHeaders(
      hasBody: body != null,
      requiresAuth: requiresAuth,
    );
    http.Response response;
    int durationInMs = -1;
    DateTime start = DateTime.now();
    try {
      response = await http.delete(
        _getUri(url, params),
        body: jsonEncode(body),
        headers: headers,
      );
      durationInMs = DateTime.now().difference(start).inMilliseconds;
    } catch (e) {
      durationInMs = DateTime.now().difference(start).inMilliseconds;
      if (!isRetry) {
        return await doDelete(
          url,
          body: body,
          requiresAuth: requiresAuth,
          params: params,
          isRetry: true,
        );
      }
      if (e is SocketException) {
        throw CustomSocketException(
          body: body,
          endpoint: url,
          hasAuth: requiresAuth,
          isRetry: isRetry,
          method: 'DELETE',
          params: params,
          socketException: e,
          durationInMs: durationInMs,
        );
      } else {
        throw ApiException(
          body: body,
          endpoint: url,
          hasAuth: requiresAuth,
          isRetry: isRetry,
          method: 'DELETE',
          params: params,
          exceptionType: e.toString(),
          durationInMs: durationInMs,
        );
      }
    }

    return await _responseHandler(
      'DELETE',
      response,
      body: body,
      isRetry: isRetry,
      onRetry: () async => await doDelete(
        url,
        body: body,
        requiresAuth: requiresAuth,
        params: params,
        isRetry: true,
      ),
      params: params,
      requiresAuth: requiresAuth,
      durationInMs: durationInMs,
      url: url,
    );
  }

  static Future<Map<String, dynamic>> doGet(
    String url, {
    bool isRetry = false,
    Map<String, String> params = const {},
    bool requiresAuth = false,
  }) async {
    await DeviceConnectivityService().isOfflineThrow();
    Map<String, String> headers = await _getHeaders(
      requiresAuth: requiresAuth,
    );
    http.Response response;
    int durationInMs = -1;
    DateTime start = DateTime.now();
    try {
      response = await http.get(
        _getUri(url, params),
        headers: headers,
      );
      durationInMs = DateTime.now().difference(start).inMilliseconds;
    } catch (e) {
      durationInMs = DateTime.now().difference(start).inMilliseconds;
      if (!isRetry) {
        return await doGet(
          url,
          requiresAuth: requiresAuth,
          params: params,
          isRetry: true,
        );
      }
      if (e is SocketException) {
        throw CustomSocketException(
          endpoint: url,
          hasAuth: requiresAuth,
          isRetry: isRetry,
          method: 'GET',
          params: params,
          socketException: e,
          durationInMs: durationInMs,
        );
      } else {
        throw ApiException(
          endpoint: url,
          exceptionType: e.toString(),
          hasAuth: requiresAuth,
          isRetry: isRetry,
          method: 'GET',
          params: params,
          durationInMs: durationInMs,
        );
      }
    }

    return await _responseHandler(
      'GET',
      response,
      isRetry: isRetry,
      onRetry: () async => await doGet(
        url,
        requiresAuth: requiresAuth,
        params: params,
        isRetry: true,
      ),
      params: params,
      requiresAuth: requiresAuth,
      durationInMs: durationInMs,
      url: url,
    );
  }

  static Future<Map<String, dynamic>> doPost(
    String url,
    Object? body, {
    bool isRetry = false,
    bool requiresAuth = false,
    Map<String, String> params = const {},
  }) async {
    await DeviceConnectivityService().isOfflineThrow();
    Map<String, String> headers = await _getHeaders(
      requiresAuth: requiresAuth,
      hasBody: true,
    );
    http.Response response;
    int durationInMs = -1;
    DateTime start = DateTime.now();
    try {
      response = await http.post(
        _getUri(url, params),
        body: jsonEncode(body),
        headers: headers,
      );
      durationInMs = DateTime.now().difference(start).inMilliseconds;
    } catch (e) {
      durationInMs = DateTime.now().difference(start).inMilliseconds;
      if (!isRetry) {
        return await doPost(
          url,
          body,
          isRetry: true,
          params: params,
          requiresAuth: requiresAuth,
        );
      }
      if (e is SocketException) {
        throw CustomSocketException(
          body: body,
          endpoint: url,
          hasAuth: requiresAuth,
          isRetry: isRetry,
          method: 'POST',
          params: params,
          socketException: e,
          durationInMs: durationInMs,
        );
      } else {
        throw ApiException(
          body: body,
          endpoint: url,
          exceptionType: e.toString(),
          hasAuth: requiresAuth,
          isRetry: isRetry,
          method: 'POST',
          params: params,
          durationInMs: durationInMs,
        );
      }
    }

    return await _responseHandler(
      'POST',
      response,
      body: body,
      isRetry: isRetry,
      onRetry: () async => await doPost(
        url,
        body,
        requiresAuth: requiresAuth,
        params: params,
        isRetry: true,
      ),
      params: params,
      requiresAuth: requiresAuth,
      durationInMs: durationInMs,
      url: url,
    );
  }

  static Future<Map<String, dynamic>> doPut(
    String url,
    Object? body, {
    bool requiresAuth = false,
    Map<String, String> params = const {},
    bool isRetry = false,
  }) async {
    await DeviceConnectivityService().isOfflineThrow();
    Map<String, String> headers = await _getHeaders(
      requiresAuth: requiresAuth,
      hasBody: true,
    );
    http.Response response;
    int durationInMs = -1;
    DateTime start = DateTime.now();
    try {
      response = await http.put(
        _getUri(url, params),
        body: jsonEncode(body),
        headers: headers,
      );
      durationInMs = DateTime.now().difference(start).inMilliseconds;
    } catch (e) {
      durationInMs = DateTime.now().difference(start).inMilliseconds;
      if (!isRetry) {
        return await doPut(
          url,
          body,
          requiresAuth: requiresAuth,
          params: params,
          isRetry: true,
        );
      }
      if (e is SocketException) {
        throw CustomSocketException(
          body: body,
          endpoint: url,
          hasAuth: requiresAuth,
          isRetry: isRetry,
          method: 'doPut',
          params: params,
          socketException: e,
          durationInMs: durationInMs,
        );
      } else {
        throw ApiException(
          body: body,
          endpoint: url,
          exceptionType: e.toString(),
          hasAuth: requiresAuth,
          isRetry: isRetry,
          method: 'PUT',
          params: params,
          durationInMs: durationInMs,
        );
      }
    }

    return await _responseHandler(
      'PUT',
      response,
      body: body,
      params: params,
      isRetry: isRetry,
      onRetry: () async => await doPut(
        url,
        body,
        requiresAuth: requiresAuth,
        params: params,
        isRetry: true,
      ),
      requiresAuth: requiresAuth,
      durationInMs: durationInMs,
      url: url,
    );
  }

  static Future<Map<String, String>> _getHeaders({
    bool hasBody = false,
    bool requiresAuth = false,
  }) async {
    Map<String, String> headers = {};
    if (hasBody) {
      headers['Content-Type'] = 'application/json; charset=UTF-8';
    }
    if (requiresAuth) {
      const String token = '';
      headers['Authorization'] = 'Bearer $token';
    }
    return headers;
  }

  static Future<Map<String, dynamic>> _responseHandler(
    String method,
    http.Response response, {
    required String url,
    Object? body,
    bool requiresAuth = false,
    Map<String, String> params = const {},
    bool isRetry = false,
    Function? onRetry,
    required int durationInMs,
  }) async {
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      if (response.body == 'null') {
        throw NotFoundException(
          body: body,
          endpoint: url,
          exceptionType: 'NotFoundException',
          isRetry: isRetry,
          hasAuth: requiresAuth,
          method: method,
          params: params,
          response: response,
          durationInMs: durationInMs,
        );
      }
      if (response.body.isEmpty) {
        return {};
      }
      try {
        dynamic data = jsonDecode(response.body);
        if (data == null) {
          throw NotFoundException(
            body: body,
            endpoint: url,
            exceptionType: 'NotFoundException',
            isRetry: isRetry,
            hasAuth: requiresAuth,
            method: method,
            params: params,
            response: response,
            durationInMs: durationInMs,
          );
        }
        if (data is! Map<String, dynamic>) {
          return {'data': data};
        }
        return data;
      } catch (e) {
        throw JsonDecodeException(
          body: body,
          endpoint: url,
          exceptionType: 'JsonDecodeException',
          isRetry: isRetry,
          hasAuth: requiresAuth,
          method: method,
          params: params,
          response: response,
          durationInMs: durationInMs,
        );
      }
    }
    switch (response.statusCode) {
      case 400:
        throw UnableToUpdate(
          body: body,
          endpoint: url,
          exceptionType: 'UnableToUpdate',
          isRetry: isRetry,
          hasAuth: requiresAuth,
          method: method,
          params: params,
          response: response,
          durationInMs: durationInMs,
        );
      case 402:
        throw InvalidException(
          body: body,
          endpoint: url,
          exceptionType: 'InvalidPayment',
          isRetry: isRetry,
          hasAuth: requiresAuth,
          method: method,
          params: params,
          response: response,
          durationInMs: durationInMs,
        );
      case 403:
        // TODO check if have a user and get new token
        if (requiresAuth && !isRetry) {
          return await onRetry?.call();
        }
        throw ApiException(
          body: body,
          endpoint: url,
          exceptionType: '403',
          isRetry: isRetry,
          hasAuth: requiresAuth,
          method: method,
          params: params,
          response: response,
          durationInMs: durationInMs,
        );
      case 404:
        throw NotFoundException(
          body: body,
          endpoint: url,
          exceptionType: 'NotFoundException',
          isRetry: isRetry,
          hasAuth: requiresAuth,
          method: method,
          params: params,
          response: response,
          durationInMs: durationInMs,
        );
      case 406:
        throw NotAcceptableException(
          body: body,
          endpoint: url,
          exceptionType: 'NotAcceptableException',
          isRetry: isRetry,
          hasAuth: requiresAuth,
          method: method,
          params: params,
          response: response,
          durationInMs: durationInMs,
        );
      case 408:
        throw ApiRequestTimeoutException(
          body: body,
          endpoint: url,
          exceptionType: 'ApiRequestTimeoutException',
          isRetry: isRetry,
          hasAuth: requiresAuth,
          method: method,
          params: params,
          response: response,
          durationInMs: durationInMs,
        );
      case 409:
        throw ConflictException(
          body: body,
          endpoint: url,
          exceptionType: 'ConflictException',
          isRetry: isRetry,
          hasAuth: requiresAuth,
          method: method,
          params: params,
          response: response,
          durationInMs: durationInMs,
        );
      default:
        throw ApiException(
          body: body,
          endpoint: url,
          exceptionType: 'UnknownApiException',
          isRetry: isRetry,
          hasAuth: requiresAuth,
          method: method,
          params: params,
          response: response,
          durationInMs: durationInMs,
        );
    }
  }

  static Uri _getUri(String url, Map<String, String> params) {
    if (Environment.local) {
      return Uri.http(
        Environment.apiUrl,
        Environment.urlExtension(url),
        params,
      );
    }

    return Uri.https(
      Environment.apiUrl,
      Environment.urlExtension(url),
      params,
    );
  }
}
