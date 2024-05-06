import 'package:logger/logger.dart';

final Logger logger = Logger(
  printer: PrettyPrinter(
    printTime: true,
  ),
);

String mapToString({
  int level = 0,
  required Map<String, dynamic> map,
}) {
  String result = '';
  map.forEach((key, value) {
    if (value is Map<String, dynamic>) {
      result += '${'-' * level} $key:\n${mapToString(level: level + 1, map: value)} : ${value.runtimeType}\n';
    } else if (value is List) {
      result += '${'-' * level} $key:\n[\n${listToString(level: level + 1, list: value)}\n] : ${value.runtimeType} \n';
    } else {
      result += '${'-' * level} $key: $value : ${value.runtimeType}\n';
    }
  });
  return result;
}

String listToString({
  int level = 0,
  required List<dynamic> list,
}) {
  String result = '';
  for (var element in list) {
    if (element is Map<String, dynamic>) {
      result += '${mapToString(level: level, map: element)} : ${element.runtimeType}\n';
    } else if (element is List) {
      result += '${listToString(level: level, list: element)} : ${element.runtimeType}\n';
    } else {
      result += '${'-' * level} $element : ${element.runtimeType}\n';
    }
  }
  return result;
}
