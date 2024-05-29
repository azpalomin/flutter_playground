import 'package:json_annotation/json_annotation.dart';

part 'app_platform_info.g.dart';

@JsonSerializable(createFactory: false, includeIfNull: false)
class AppPlatformInfo {
  final String? version;
  final String? environment;
  final String? buildNumber;
  final String? appName;
  final String? platform;

  const AppPlatformInfo({
    this.version,
    this.environment,
    this.buildNumber,
    this.appName,
    this.platform,
  });

  Map<String, dynamic> toJson() => _$AppPlatformInfoToJson(this);

  @override
  String toString() {
    return 'AppPlatformInfo(version: $version, Environment: $environment, buildNumber: $buildNumber, appName: $appName, platform: $platform)';
  }
}
