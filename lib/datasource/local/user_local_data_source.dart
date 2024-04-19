import 'dart:convert';
import 'dart:io';

import 'package:clean_architecture_biv/shared/mixin/log_mixin.dart';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../model/user_model.dart';
import '../../shared/constant/shared_preference_constants.dart';

abstract class UserLocalDataSource {
  ///* Token
  Future<bool> saveAccessToken(String token);
  Future<void> saveRefreshToken(String token);
  Future<void> logout();
  Future<String?> get accessToken;
  Future<String?> get refreshToken;

  ///* User
  Future<void> saveUser(UserModel user);
  UserModel? getUser();

  ///* Config App
  String get languageCode;
  String get deviceToken;
  Future<bool> saveLanguageCode(String languageCode);

  Future<String> getDeviceId();
  bool get isDarkMode;
  bool get isLoggedIn;

  bool get isFirstLogin;
  bool get isFirstLaunchApp;
  Future<bool> saveIsFirstLogin(bool isFirstLogin);
  Future<bool> saveIsFirsLaunchApp(bool isFirstLaunchApp);
  Future<bool> saveIsDarkMode(bool isDarkMode);
  Future<bool> saveDeviceToken(String token);
}

class UserLocalDatasourceImplement
    with LogMixin
    implements UserLocalDataSource {
  UserLocalDatasourceImplement(
    this._secureStorage,
    this._sharedPreferences,
  );

  final FlutterSecureStorage _secureStorage;
  final SharedPreferences _sharedPreferences;

  @override
  Future<bool> saveAccessToken(String token) async {
    try {
      await _secureStorage.write(
          key: SharedPreferenceKeys.accessToken,
          value: token,
          aOptions: const AndroidOptions(encryptedSharedPreferences: false),

          /// [synchronizable] corresponding `kSecAttrSynchronizable` under IOS.
          /// [synchronizable] is false: Data save in KeyChain do not sync over Icloud
          /// [synchronizable] is true: Data save in KeyChain do sync over Icloud
          iOptions: const IOSOptions(
              synchronizable: false,
              accessibility: KeychainAccessibility.first_unlock_this_device));
      return true;
    } catch (e) {
      logE(e);
      return false;
    }
  }

  @override
  Future<String?> get accessToken =>
      _secureStorage.read(key: SharedPreferenceKeys.accessToken);

  @override
  Future<void> logout() async => await Future.wait(
        [
          _sharedPreferences.remove(SharedPreferenceKeys.currentUser),
          _sharedPreferences.remove(SharedPreferenceKeys.accessToken),
          _sharedPreferences.remove(SharedPreferenceKeys.refreshToken),
        ],
      );

  @override
  UserModel? getUser() {
    final data = _sharedPreferences.getString(SharedPreferenceKeys.currentUser);

    if (data == null) {
      return null;
    }

    return UserModel.fromJson(json.decode(data));
  }

  @override
  Future<void> saveUser(UserModel user) async {
    final data = json.encode(user.toJson());
    await _sharedPreferences.setString(SharedPreferenceKeys.currentUser, data);
  }

  @override
  Future<String> getDeviceId() async {
    final deviceInfoPlugin = DeviceInfoPlugin();

    if (Platform.isIOS) {
      final IosDeviceInfo iOSInfo = await deviceInfoPlugin.iosInfo;
      return iOSInfo.identifierForVendor ?? '';
    }

    final androidInfo = await deviceInfoPlugin.androidInfo;
    return androidInfo.id;
  }

  @override
  Future<bool> saveIsDarkMode(bool isDarkMode) {
    return _sharedPreferences.setBool(
        SharedPreferenceKeys.isDarkMode, isDarkMode);
  }

  @override
  Future<bool> saveDeviceToken(String token) {
    return _sharedPreferences.setString(
        SharedPreferenceKeys.deviceToken, token);
  }

  @override
  bool get isDarkMode {
    return _sharedPreferences.getBool(SharedPreferenceKeys.isDarkMode) ?? false;
  }

  @override
  String get deviceToken {
    return _sharedPreferences.getString(SharedPreferenceKeys.deviceToken) ?? '';
  }

  @override
  String get languageCode =>
      _sharedPreferences.getString(SharedPreferenceKeys.languageCode) ?? '';

  @override
  bool get isFirstLogin =>
      _sharedPreferences.getBool(SharedPreferenceKeys.isFirstLogin) ?? true;

  @override
  bool get isFirstLaunchApp =>
      _sharedPreferences.getBool(SharedPreferenceKeys.isFirstLaunchApp) ?? true;

  @override
  Future<String?> get refreshToken {
    return _secureStorage.read(key: SharedPreferenceKeys.refreshToken);
  }

  @override
  bool get isLoggedIn {
    final token =
        _sharedPreferences.getString(SharedPreferenceKeys.accessToken) ?? '';

    return token.isNotEmpty;
  }

  @override
  Future<bool> saveLanguageCode(String languageCode) {
    return _sharedPreferences.setString(
        SharedPreferenceKeys.languageCode, languageCode);
  }

  @override
  Future<bool> saveIsFirstLogin(bool isFirstLogin) {
    return _sharedPreferences.setBool(
        SharedPreferenceKeys.isFirstLogin, isFirstLogin);
  }

  @override
  Future<bool> saveIsFirsLaunchApp(bool isFirstLaunchApp) {
    return _sharedPreferences.setBool(
        SharedPreferenceKeys.isFirstLaunchApp, isFirstLaunchApp);
  }

  @override
  Future<void> saveRefreshToken(String token) async {
    await _secureStorage.write(
      key: SharedPreferenceKeys.refreshToken,
      value: token,
    );
  }
}
