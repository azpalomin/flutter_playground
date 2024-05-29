import 'package:flutter_shared/models/utils/error_location.dart';
import 'package:json_annotation/json_annotation.dart';

part 'custom_trace.g.dart';

@JsonSerializable(createFactory: false, includeIfNull: false)
class CustomTrace {
  final StackTrace _trace;

  late final List<ErrorLocation> locations;

  CustomTrace(this._trace) {
    _parseTrace();
  }

  Map<String, dynamic> toJson() => _$CustomTraceToJson(this);

  @override
  String toString() {
    return '[  ${locations.map((e) => e.toString()).join(' --- ')}  ]';
  }

  void _parseTrace() {
    List<String> traceString = _trace.toString().split('\n');
    locations = traceString
        .map((e) {
          int indexOfFileName = e.indexOf(RegExp(r'[A-Za-z]+.dart'));
          if (indexOfFileName == -1) return null;
          String fileInfo = e.substring(indexOfFileName);

          List<String> listOfInfos = fileInfo.split(' ');
          if (listOfInfos.length < 2) return null;
          List<String> lineInfo = listOfInfos[1].split(':');

          return ErrorLocation(
            functionName: listOfInfos.last,
            path: listOfInfos.first,
            line: listOfInfos.isNotEmpty ? int.parse(lineInfo[0]) : null,
            column: listOfInfos.length > 1 ? int.parse(lineInfo[1]) : null,
          );
        })
        .whereType<ErrorLocation>()
        .toList();
  }
}
