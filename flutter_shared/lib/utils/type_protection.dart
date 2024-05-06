import 'dart:io';

String? emptyToNull(dynamic value) {
  try {
    String output = value as String;
    if (output.isEmpty) return null;
    return output;
  } catch (e) {
    return null;
  }
}

String? enumToString(Enum? e) {
  return emptyToNull(e?.name);
}

DateTime? fromHttpDate(String? date) {
  if (date == null || date.isEmpty) return null;
  try {
    return HttpDate.parse(date).toUtc();
  } catch (_) {
    return DateTime.tryParse(date)?.toUtc();
  }
}

O? fromJson<O>(dynamic value) {
  try {
    O output = value as O;
    return output;
  } catch (e) {
    return null;
  }
}

String? toHttpDate(DateTime? date) {
  if (date == null) return null;
  return HttpDate.format(date.toUtc());
}

dynamic toNull(_) => null;

List<String> stringToArray(dynamic json) {
  if (json is List) return json.map((e) => e as String).toList();
  if (json is String) return json.split(',');
  return [];
}

String objectToId(dynamic json) {
  if (json is Map) return json['_id'] as String;
  if (json is String) return json;
  return '';
}

List<String> listOfObjectToId(dynamic json) {
  if (json is List) return json.map((e) => objectToId(e)).toList();
  return [];
}

double toDoubleType(dynamic value) {
  if (value is double) return value;
  if (value is String) return double.tryParse(value) ?? 0;
  if (value is int) return value.toDouble();
  return 0;
}

int toIntType(dynamic value) {
  if (value is int) return value;
  if (value is String) return double.tryParse(value)?.toInt() ?? 0;
  if (value is double) return value.toInt();
  return 0;
}

bool toBoolType(dynamic value) {
  if (value is bool) return value;
  if (value is String) return value.toLowerCase() == 'true';
  return false;
}
