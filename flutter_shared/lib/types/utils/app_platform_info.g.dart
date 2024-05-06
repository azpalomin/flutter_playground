// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_platform_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$AppPlatformInfoToJson(AppPlatformInfo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('version', instance.version);
  writeNotNull('environment', instance.environment);
  writeNotNull('buildNumber', instance.buildNumber);
  writeNotNull('appName', instance.appName);
  writeNotNull('platform', instance.platform);
  return val;
}
