import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:flutter_shared/services/utils/exception_catcher.dart';
import 'package:flutter_shared/utils/type_protection.dart';
import 'package:json_annotation/json_annotation.dart';

part 'full_user.g.dart';

@CopyWith(skipFields: true)
@JsonSerializable()
class FullUser {
  @CopyWithField(immutable: true)
  final String id;
  @JsonKey(includeIfNull: false)
  final DateTime? creationDate;
  @JsonKey(includeIfNull: false)
  final DateTime? lastLoginDate;

  // Personal information
  @JsonKey(includeIfNull: false, fromJson: emptyToNull)
  final String? firstName;
  @JsonKey(includeIfNull: false, fromJson: emptyToNull)
  final String? lastName; // Backend shortend on public User to the initial -> keep on admin and self
  @JsonKey(includeIfNull: false, fromJson: emptyToNull)
  final String? profilePictureURL;

  // Private
  // User Information
  @JsonKey(includeIfNull: false, fromJson: emptyToNull)
  final String? email;
  @JsonKey(includeIfNull: false)
  final String? phoneNumber;

  const FullUser({
    required this.id,
    this.creationDate,
    this.lastLoginDate,
    this.firstName,
    this.lastName,
    this.profilePictureURL,
    this.email,
    this.phoneNumber,
  });

  factory FullUser.fromJson(Map<String, dynamic> json) => ExceptionCatcher.typeErrorSerializer(
        () => _$FullUserFromJson(json),
        json,
        StackTrace.current,
      );
  Map<String, dynamic> toJson() => _$FullUserToJson(this);

  @override
  int get hashCode => id.hashCode;

  @override
  bool operator ==(Object other) {
    return (other is FullUser) && (other.id == id);
  }

  @override
  String toString() => [firstName, lastName].whereType<String>().join(' ');

  String toDisplayName() =>
      '${[firstName, lastName?.substring(0, 1)].whereType<String>().join(' ')}${lastName == null ? '' : '.'}';
}
