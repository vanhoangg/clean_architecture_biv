import 'package:dio/dio.dart';

import '../../local/user_local_data_source.dart';
import 'base_interceptor.dart';

class AccessTokenInterceptor extends BaseInterceptor {
  AccessTokenInterceptor(this._userLocalDataSource);

  final UserLocalDataSource _userLocalDataSource;

  @override
  int get priority => BaseInterceptor.accessTokenPriority;

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await _userLocalDataSource.accessToken;
    if (token?.isNotEmpty ?? false) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    handler.next(options);
  }
}
