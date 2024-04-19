import 'package:package_info_plus/package_info_plus.dart';
import 'package:clean_architecture_biv/shared/util/function/app_log_util.dart';

class AppInfo {
  PackageInfo? _packageInfo;

  String get appName => _packageInfo?.appName ?? '';
  String get applicationId => _packageInfo?.packageName ?? '';
  String get versionCode => _packageInfo?.buildNumber ?? '';
  String get versionName => _packageInfo?.version ?? '';

  Future<void> init() async {
    _packageInfo = await PackageInfo.fromPlatform();
    Log.d(_packageInfo!.packageName, name: 'APPLICATION_ID');
    Log.d(_packageInfo!.appName, name: 'APP_NAME');
    Log.d(_packageInfo!.version, name: 'VERSION_NAME');
    Log.d(_packageInfo!.buildNumber, name: 'VERSION_CODE');
  }
}
