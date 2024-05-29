// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$ErrorLocationToJson(ErrorLocation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('column', instance.column);
  writeNotNull('functionName', instance.functionName);
  writeNotNull('line', instance.line);
  writeNotNull('path', instance.path);
  return val;
}
