import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../definition/definition.dart';
import '../../model/user_model.dart';

abstract class UserLocalDataSource {
  Future<void> saveToken(String token);

  Future<String?> getToken();

  Future<void> deleteToken();

  Future<void> saveUser(UserModel user);

  UserModel? getUser();

  Future<String> getDeviceId();
}

class UserLocalDatasourceImplement implements UserLocalDataSource {
  UserLocalDatasourceImplement(
    this._secureStorage,
    this._sharedPreferences,
  );

  final FlutterSecureStorage _secureStorage;
  final SharedPreferences _sharedPreferences;

  @override
  Future<void> saveToken(String token) async {
    return _secureStorage.write(
        key: StorageConfig.keyToken,
        value: token,
        aOptions: const AndroidOptions(encryptedSharedPreferences: false),

        /// [synchronizable] corresponding `kSecAttrSynchronizable` under IOS.
        /// [synchronizable] is false: Data save in KeyChain do not sync over Icloud
        /// [synchronizable] is true: Data save in KeyChain do sync over Icloud
        iOptions: const IOSOptions(
            synchronizable: false,
            accessibility: KeychainAccessibility.first_unlock_this_device));
  }

  @override
  Future<String?> getToken() =>
      _secureStorage.read(key: StorageConfig.keyToken);

  @override
  Future<void> deleteToken() =>
      _secureStorage.delete(key: StorageConfig.keyToken);

  @override
  UserModel? getUser() {
    final data = _sharedPreferences.getString(StorageConfig.keyUserId);

    if (data == null) {
      return null;
    }

    return UserModel.fromJson(json.decode(data));
  }

  @override
  Future<void> saveUser(UserModel user) async {
    final data = json.encode(user.toJson());
    await _sharedPreferences.setString(StorageConfig.keyUserId, data);
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
}
