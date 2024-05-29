import 'package:new_version_plus/new_version_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppVersionUtil {
  static Future<String?> getCurrentAppVersion() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }

  static Future<String?> getLatestAppVersion() async {
    final newVersion = NewVersionPlus();
    final status = await newVersion.getVersionStatus();
    return status != null ? status.storeVersion : '';
  }

  static Future<bool?> checkIsLatestAppVersion() async {
    final status = await NewVersionPlus().getVersionStatus();
    return status != null && status.canUpdate ? true : false;
  }
}
