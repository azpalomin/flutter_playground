import 'package:json_annotation/json_annotation.dart';

part 'error_location.g.dart';

@JsonSerializable(createFactory: false, includeIfNull: false)
class ErrorLocation {
  final int? column;
  final String? functionName;
  final int? line;
  final String? path;

  const ErrorLocation({
    this.column,
    this.functionName,
    this.line,
    this.path,
  });

  Map<String, dynamic> toJson() => _$ErrorLocationToJson(this);

  @override
  String toString() {
    return '$path $line:$column $functionName';
  }
}
