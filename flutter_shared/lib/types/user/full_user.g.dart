// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'full_user.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FullUserCWProxy {
  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// FullUser(...).copyWith(id: 12, name: "My name")
  /// ````
  FullUser call({
    DateTime? creationDate,
    DateTime? lastLoginDate,
    String? firstName,
    String? lastName,
    String? profilePictureURL,
    String? email,
    String? phoneNumber,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfFullUser.copyWith(...)`.
class _$FullUserCWProxyImpl implements _$FullUserCWProxy {
  const _$FullUserCWProxyImpl(this._value);

  final FullUser _value;

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored.
  ///
  /// Usage
  /// ```dart
  /// FullUser(...).copyWith(id: 12, name: "My name")
  /// ````
  FullUser call({
    Object? creationDate = const $CopyWithPlaceholder(),
    Object? lastLoginDate = const $CopyWithPlaceholder(),
    Object? firstName = const $CopyWithPlaceholder(),
    Object? lastName = const $CopyWithPlaceholder(),
    Object? profilePictureURL = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? phoneNumber = const $CopyWithPlaceholder(),
  }) {
    return FullUser(
      id: _value.id,
      creationDate: creationDate == const $CopyWithPlaceholder()
          ? _value.creationDate
          // ignore: cast_nullable_to_non_nullable
          : creationDate as DateTime?,
      lastLoginDate: lastLoginDate == const $CopyWithPlaceholder()
          ? _value.lastLoginDate
          // ignore: cast_nullable_to_non_nullable
          : lastLoginDate as DateTime?,
      firstName: firstName == const $CopyWithPlaceholder()
          ? _value.firstName
          // ignore: cast_nullable_to_non_nullable
          : firstName as String?,
      lastName: lastName == const $CopyWithPlaceholder()
          ? _value.lastName
          // ignore: cast_nullable_to_non_nullable
          : lastName as String?,
      profilePictureURL: profilePictureURL == const $CopyWithPlaceholder()
          ? _value.profilePictureURL
          // ignore: cast_nullable_to_non_nullable
          : profilePictureURL as String?,
      email: email == const $CopyWithPlaceholder()
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String?,
      phoneNumber: phoneNumber == const $CopyWithPlaceholder()
          ? _value.phoneNumber
          // ignore: cast_nullable_to_non_nullable
          : phoneNumber as String?,
    );
  }
}

extension $FullUserCopyWith on FullUser {
  /// Returns a callable class that can be used as follows: `instanceOfFullUser.copyWith(...)`.
  // ignore: library_private_types_in_public_api
  _$FullUserCWProxy get copyWith => _$FullUserCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FullUser _$FullUserFromJson(Map<String, dynamic> json) => FullUser(
      id: json['id'] as String,
      creationDate: json['creationDate'] == null
          ? null
          : DateTime.parse(json['creationDate'] as String),
      lastLoginDate: json['lastLoginDate'] == null
          ? null
          : DateTime.parse(json['lastLoginDate'] as String),
      firstName: emptyToNull(json['firstName']),
      lastName: emptyToNull(json['lastName']),
      profilePictureURL: emptyToNull(json['profilePictureURL']),
      email: emptyToNull(json['email']),
      phoneNumber: json['phoneNumber'] as String?,
    );

Map<String, dynamic> _$FullUserToJson(FullUser instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('creationDate', instance.creationDate?.toIso8601String());
  writeNotNull('lastLoginDate', instance.lastLoginDate?.toIso8601String());
  writeNotNull('firstName', instance.firstName);
  writeNotNull('lastName', instance.lastName);
  writeNotNull('profilePictureURL', instance.profilePictureURL);
  writeNotNull('email', instance.email);
  writeNotNull('phoneNumber', instance.phoneNumber);
  return val;
}
