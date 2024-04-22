import 'dart:convert';
import 'dart:io';

import 'package:clean_architecture_biv/shared/mixin/log_mixin.dart';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../remote/model/user_model.dart';
import '../../../shared/constant/shared_preference_constants.dart';

/// Abstract class representing the local data source for user-related operations.
abstract class UserLocalDataSource {
  /// Saves the access token.
  Future<bool> saveAccessToken(String token);

  /// Saves the refresh token.
  Future<void> saveRefreshToken(String token);

  /// Logs out the user.
  Future<void> logout();

  /// Retrieves the access token.
  Future<String?> get accessToken;

  /// Retrieves the refresh token.
  Future<String?> get refreshToken;

  /// Saves the user data.
  Future<void> saveUser(UserModel user);

  /// Retrieves the user data.
  UserModel? getUser();

  /// Retrieves the language code.
  String get languageCode;

  /// Retrieves the device token.
  String get deviceToken;

  /// Saves the language code.
  Future<bool> saveLanguageCode(String languageCode);

  /// Retrieves the device ID.
  Future<String> getDeviceId();

  /// Checks if the dark mode is enabled.
  bool get isDarkMode;

  /// Checks if the user is logged in.
  bool get isLoggedIn;

  /// Checks if it's the user's first login.
  bool get isFirstLogin;

  /// Checks if it's the app's first launch.
  bool get isFirstLaunchApp;

  /// Saves the first login status.
  Future<bool> saveIsFirstLogin(bool isFirstLogin);

  /// Saves the first app launch status.
  Future<bool> saveIsFirsLaunchApp(bool isFirstLaunchApp);

  /// Saves the dark mode status.
  Future<bool> saveIsDarkMode(bool isDarkMode);

  /// Saves the device token.
  Future<bool> saveDeviceToken(String token);
}

/// Implementation of the [UserLocalDataSource] interface.
/// This class provides methods to interact with the local storage for user-related data.
class UserLocalDatasourceImplement
    with LogMixin
    implements UserLocalDataSource {
  UserLocalDatasourceImplement(
    this._secureStorage,
    this._sharedPreferences,
  );

  final FlutterSecureStorage _secureStorage;
  final SharedPreferences _sharedPreferences;

  /// Saves the access token to the secure storage.
  /// Returns `true` if the token is successfully saved, `false` otherwise.
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

  /// Retrieves the access token from the secure storage.
  @override
  Future<String?> get accessToken =>
      _secureStorage.read(key: SharedPreferenceKeys.accessToken);

  /// Removes user-related data from the shared preferences.
  @override
  Future<void> logout() async => await Future.wait(
        [
          _sharedPreferences.remove(SharedPreferenceKeys.currentUser),
          _sharedPreferences.remove(SharedPreferenceKeys.accessToken),
          _sharedPreferences.remove(SharedPreferenceKeys.refreshToken),
        ],
      );

  /// Retrieves the user model from the shared preferences.
  /// Returns `null` if the user model is not found.
  @override
  UserModel? getUser() {
    final data = _sharedPreferences.getString(SharedPreferenceKeys.currentUser);

    if (data == null) {
      return null;
    }

    return UserModel.fromJson(json.decode(data));
  }

  /// Saves the user model to the shared preferences.
  @override
  Future<void> saveUser(UserModel user) async {
    final data = json.encode(user.toJson());
    await _sharedPreferences.setString(SharedPreferenceKeys.currentUser, data);
  }

  /// Retrieves the device ID.
  /// On iOS, it returns the identifier for vendor.
  /// On Android, it returns the device ID.
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

  /// Saves the dark mode preference to the shared preferences.
  @override
  Future<bool> saveIsDarkMode(bool isDarkMode) {
    return _sharedPreferences.setBool(
        SharedPreferenceKeys.isDarkMode, isDarkMode);
  }

  /// Saves the device token to the shared preferences.
  @override
  Future<bool> saveDeviceToken(String token) {
    return _sharedPreferences.setString(
        SharedPreferenceKeys.deviceToken, token);
  }

  /// Retrieves the dark mode preference from the shared preferences.
  @override
  bool get isDarkMode {
    return _sharedPreferences.getBool(SharedPreferenceKeys.isDarkMode) ?? false;
  }

  /// Retrieves the device token from the shared preferences.
  @override
  String get deviceToken {
    return _sharedPreferences.getString(SharedPreferenceKeys.deviceToken) ?? '';
  }

  /// Retrieves the language code from the shared preferences.
  @override
  String get languageCode =>
      _sharedPreferences.getString(SharedPreferenceKeys.languageCode) ?? '';

  /// Retrieves the flag indicating whether it is the first login from the shared preferences.
  @override
  bool get isFirstLogin =>
      _sharedPreferences.getBool(SharedPreferenceKeys.isFirstLogin) ?? true;

  /// Retrieves the flag indicating whether it is the first launch of the app from the shared preferences.
  @override
  bool get isFirstLaunchApp =>
      _sharedPreferences.getBool(SharedPreferenceKeys.isFirstLaunchApp) ?? true;

  /// Retrieves the refresh token from the secure storage.
  @override
  Future<String?> get refreshToken {
    return _secureStorage.read(key: SharedPreferenceKeys.refreshToken);
  }

  /// Retrieves the flag indicating whether the user is logged in from the shared preferences.
  @override
  bool get isLoggedIn {
    final token =
        _sharedPreferences.getString(SharedPreferenceKeys.accessToken) ?? '';

    return token.isNotEmpty;
  }

  /// Saves the language code to the shared preferences.
  @override
  Future<bool> saveLanguageCode(String languageCode) {
    return _sharedPreferences.setString(
        SharedPreferenceKeys.languageCode, languageCode);
  }

  /// Saves the flag indicating whether it is the first login to the shared preferences.
  @override
  Future<bool> saveIsFirstLogin(bool isFirstLogin) {
    return _sharedPreferences.setBool(
        SharedPreferenceKeys.isFirstLogin, isFirstLogin);
  }

  /// Saves the flag indicating whether it is the first launch of the app to the shared preferences.
  @override
  Future<bool> saveIsFirsLaunchApp(bool isFirstLaunchApp) {
    return _sharedPreferences.setBool(
        SharedPreferenceKeys.isFirstLaunchApp, isFirstLaunchApp);
  }

  /// Saves the refresh token to the secure storage.
  @override
  Future<void> saveRefreshToken(String token) async {
    await _secureStorage.write(
      key: SharedPreferenceKeys.refreshToken,
      value: token,
    );
  }
}
