import 'package:flutter_shared/types/user/full_user.dart';
import 'package:flutter_shared/types/utils/app_platform_info.dart';
import 'package:flutter_shared/types/utils/custom_trace.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exception_report.g.dart';

@JsonSerializable(createFactory: false, includeIfNull: false)
class ExceptionReport {
  // Exception info
  final String name;
  @JsonKey(includeIfNull: false)
  final String? code;
  @JsonKey(includeIfNull: false)
  final String? message;
  @JsonKey(includeIfNull: false)
  final String? userText;
  @JsonKey(includeIfNull: false)
  final String? additional;
  @JsonKey(includeIfNull: false)
  final bool? warning;

  // Conditions
  final DateTime time;
  @JsonKey(includeIfNull: false)
  final FullUser? user;
  @JsonKey(includeIfNull: false)
  final AppPlatformInfo? appInfo;

  // Api exception
  @JsonKey(includeIfNull: false)
  final String? endpoint;
  @JsonKey(includeIfNull: false)
  final bool? hasAuth;
  @JsonKey(includeIfNull: false)
  final Object? body;
  @JsonKey(includeIfNull: false)
  final Object? params;
  @JsonKey(includeIfNull: false)
  final String? method;
  @JsonKey(includeIfNull: false)
  final int? durationInMs;
  @JsonKey(includeIfNull: false)
  final bool? isRetry;

  @JsonKey(includeIfNull: false)
  CustomTrace? trace;

  ExceptionReport({
    required this.name,
    this.code,
    this.userText,
    this.message,
    this.additional,
    required this.time,
    this.user,
    this.appInfo,
    this.endpoint,
    this.hasAuth,
    this.body,
    this.params,
    this.method,
    this.warning,
    this.isRetry,
    this.durationInMs,
    StackTrace? stackTrace,
  }) {
    trace = stackTrace != null ? CustomTrace(stackTrace) : null;
  }

  Map<String, dynamic> toJson() => _$ExceptionReportToJson(this);
}
