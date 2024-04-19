import 'package:clean_architecture_biv/app/app_bloc/cubit/app_cubit.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../datasource/datasource.dart';

import '../datasource/remote/services/authentication/auth_api_services.dart';
import '../shared/helper/helper.dart';

final di = GetIt.asNewInstance()..allowReassignment = true;

Future<void> initializeDependencies() async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  di
    ..registerLazySingleton<AppInfo>(() => AppInfo())
    ..registerFactory<HeaderInterceptor>(() => HeaderInterceptor(di<AppInfo>()))
    ..registerLazySingleton<NoneAuthAppServerApiClient>(
        () => NoneAuthAppServerApiClient(di<HeaderInterceptor>()))
    ..registerFactory<RefreshTokenInterceptor>(() => RefreshTokenInterceptor(
          di<UserLocalDataSource>(),
          di<RefreshTokenApiService>(),
          di<NoneAuthAppServerApiClient>(),
        ))
    ..registerFactory<SharedPreferences>(() => sharedPreferences)
    ..registerFactory<FlutterSecureStorage>(() => const FlutterSecureStorage())
    ..registerLazySingleton<UserLocalDataSource>(() =>
        UserLocalDatasourceImplement(
            di<FlutterSecureStorage>(), di<SharedPreferences>()))
    // ..registerFactory<AccessTokenInterceptor>(
    //     () => AccessTokenInterceptor(di<UserLocalDataSource>()))
    // ..registerLazySingleton<RefreshTokenApiClient>(() => RefreshTokenApiClient(
    //     di<HeaderInterceptor>(), di<AccessTokenInterceptor>()))
    // ..registerLazySingleton<RefreshTokenApiService>(
    //     () => RefreshTokenApiService(di<RefreshTokenApiClient>()))
    // ..registerLazySingleton<AuthAppServerApiClient>(() =>
    //     AuthAppServerApiClient(di<HeaderInterceptor>(),
    //         di<AccessTokenInterceptor>(), di<RefreshTokenInterceptor>()))
    ..registerLazySingleton<AuthApiServices>(
        () => AuthApiServices(di<UserLocalDataSource>()))
    ..registerFactory<FirebaseStorageErrorResponseMapper>(
        () => FirebaseStorageErrorResponseMapper())
    ..registerFactory<JsonArrayErrorResponseMapper>(
        () => JsonArrayErrorResponseMapper())
    ..registerFactory<AccessTokenInterceptor>(
        () => AccessTokenInterceptor(di<UserLocalDataSource>()))
    ..registerFactory<HeaderInterceptor>(() => HeaderInterceptor(di<AppInfo>()))
    ..registerFactory<RefreshTokenInterceptor>(() => RefreshTokenInterceptor(
          di<UserLocalDataSource>(),
          di<RefreshTokenApiService>(),
          di<NoneAuthAppServerApiClient>(),
        ))
    ..registerFactory<CustomLogInterceptor>(() => CustomLogInterceptor());

  // await DomainConfig.getInstance().init();
  // await _applicationConfig.init();
}
