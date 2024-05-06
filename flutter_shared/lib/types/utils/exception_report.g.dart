// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exception_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$ExceptionReportToJson(ExceptionReport instance) {
  final val = <String, dynamic>{
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('code', instance.code);
  writeNotNull('message', instance.message);
  writeNotNull('userText', instance.userText);
  writeNotNull('additional', instance.additional);
  writeNotNull('warning', instance.warning);
  val['time'] = instance.time.toIso8601String();
  writeNotNull('user', instance.user);
  writeNotNull('appInfo', instance.appInfo);
  writeNotNull('endpoint', instance.endpoint);
  writeNotNull('hasAuth', instance.hasAuth);
  writeNotNull('body', instance.body);
  writeNotNull('params', instance.params);
  writeNotNull('method', instance.method);
  writeNotNull('durationInMs', instance.durationInMs);
  writeNotNull('isRetry', instance.isRetry);
  writeNotNull('trace', instance.trace);
  return val;
}
