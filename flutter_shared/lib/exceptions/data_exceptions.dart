import 'dart:io';

import 'package:http/http.dart';

class ApiException implements Exception {
  final Object? body;
  final String? endpoint;
  final String? exceptionType;
  final bool? hasAuth;
  final bool isRetry;
  final String? method;
  final Object? params;
  final Response? response;
  final int durationInMs;

  const ApiException({
    this.body,
    this.exceptionType,
    this.endpoint,
    this.hasAuth,
    required this.isRetry,
    this.method,
    this.params,
    this.response,
    required this.durationInMs,
  });
}

class CustomSocketException implements Exception {
  final Object? body;
  final String? endpoint;
  final bool? hasAuth;
  final bool isRetry;
  final String? method;
  final Object? params;
  final SocketException socketException;
  final int durationInMs;

  const CustomSocketException({
    this.body,
    this.endpoint,
    this.hasAuth,
    required this.isRetry,
    this.method,
    this.params,
    required this.socketException,
    required this.durationInMs,
  });
}

class ConflictException extends ApiException {
  ConflictException({
    super.body,
    super.endpoint,
    super.exceptionType,
    super.hasAuth,
    required super.isRetry,
    super.method,
    super.params,
    super.response,
    required super.durationInMs,
  });
}

class JsonDecodeException extends ApiException {
  JsonDecodeException({
    super.body,
    super.endpoint,
    super.exceptionType,
    super.hasAuth,
    required super.isRetry,
    super.method,
    super.params,
    super.response,
    required super.durationInMs,
  });
}

class ApiRequestTimeoutException extends ApiException {
  ApiRequestTimeoutException({
    super.body,
    super.endpoint,
    super.exceptionType,
    super.hasAuth,
    required super.isRetry,
    super.method,
    super.params,
    super.response,
    required super.durationInMs,
  });
}

class NotAcceptableException extends ApiException {
  NotAcceptableException({
    super.body,
    super.endpoint,
    super.exceptionType,
    super.hasAuth,
    required super.isRetry,
    super.method,
    super.params,
    super.response,
    required super.durationInMs,
  });
}

class NotFoundException extends ApiException {
  NotFoundException({
    super.body,
    super.endpoint,
    super.exceptionType,
    super.hasAuth,
    super.isRetry = false,
    super.method,
    super.params,
    super.response,
    super.durationInMs = -1,
  });
}

class InvalidException extends ApiException {
  InvalidException({
    super.body,
    super.endpoint,
    super.exceptionType,
    super.hasAuth,
    super.isRetry = false,
    super.method,
    super.params,
    super.response,
    super.durationInMs = -1,
  });
}

class UnableToUpdate extends ApiException {
  UnableToUpdate({
    super.body,
    super.endpoint,
    super.exceptionType,
    super.hasAuth,
    required super.isRetry,
    super.method,
    super.params,
    super.response,
    required super.durationInMs,
  });
}

class UnauthorizedException extends ApiException {
  UnauthorizedException({
    super.body,
    super.endpoint,
    super.exceptionType,
    super.hasAuth,
    required super.isRetry,
    super.method,
    super.params,
    super.response,
    required super.durationInMs,
  });
}
