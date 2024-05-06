import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_shared/types/utils/app_platform_info.dart';
import 'package:flutter_shared/utils/environment.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppInfoUtil {
  AppPlatformInfo? _appInfo;

  static final AppInfoUtil _shared = AppInfoUtil._sharedInstance();
  factory AppInfoUtil() => _shared;
  AppInfoUtil._sharedInstance();

  AppPlatformInfo? get appInfo => _appInfo;

  Future<void> getAppInfo() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();

    _appInfo = AppPlatformInfo(
      environment: Environment.environment,
      version: packageInfo.version,
      buildNumber: packageInfo.buildNumber,
      platform: kIsWeb
          ? 'web'
          : Platform.isAndroid
              ? 'android'
              : 'ios',
    );
  }
}
