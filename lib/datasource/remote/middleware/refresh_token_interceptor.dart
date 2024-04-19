import 'dart:collection';
import 'dart:io';

import 'package:clean_architecture_biv/datasource/local/user_local_data_source.dart';
import 'package:dio/dio.dart';

import 'package:tuple/tuple.dart';

import '../../../shared/constant/server/server_request_response_constants.dart';
import '../client/none_auth_app_server_api_client.dart';
import '../services/refresh_token_api_service.dart';
import 'base_interceptor.dart';

class RefreshTokenInterceptor extends BaseInterceptor {
  RefreshTokenInterceptor(
    this.appPreferences,
    this.refreshTokenService,
    this._noneAuthAppServerApiClient,
  );

  final UserLocalDataSource appPreferences;
  final RefreshTokenApiService refreshTokenService;
  final NoneAuthAppServerApiClient _noneAuthAppServerApiClient;

  var _isRefreshing = false;
  final _queue = Queue<Tuple2<RequestOptions, ErrorInterceptorHandler>>();

  @override
  int get priority => BaseInterceptor.refreshTokenPriority;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == HttpStatus.unauthorized) {
      final options = err.response!.requestOptions;
      _onExpiredToken(options: options, handler: handler);
    } else {
      handler.next(err);
    }
  }

  void _putAccessToken({
    required Map<String, dynamic> headers,
    required String accessToken,
  }) {
    headers[ServerRequestResponseConstants.basicAuthorization] =
        '${ServerRequestResponseConstants.bearer} $accessToken';
  }

  Future<void> _onExpiredToken({
    required RequestOptions options,
    required ErrorInterceptorHandler handler,
  }) async {
    _queue.addLast(Tuple2(options, handler));
    if (!_isRefreshing) {
      _isRefreshing = true;
      try {
        final newToken = await _refreshToken();
        await _onRefreshTokenSuccess(newToken);
      } catch (e) {
        _onRefreshTokenError(e);
      } finally {
        _isRefreshing = false;
        _queue.clear();
      }
    }
  }

  Future<String> _refreshToken() async {
    return "";
    // _isRefreshing = true;
    // final String refreshToken = await appPreferences.refreshToken ?? '';
    // final refreshTokenResponse =
    //     await refreshTokenService.refreshToken(refreshToken);
    // await Future.wait(
    //   [
    //     appPreferences.saveAccessToken(
    //       refreshTokenResponse?.data?.accessToken ?? '',
    //     ),
    //   ],
    // );

    // return refreshTokenResponse?.data?.accessToken ?? '';
  }

  Future<void> _onRefreshTokenSuccess(String newToken) async {
    await Future.wait(_queue.map(
      (requestInfo) => _requestWithNewToken(
        options: requestInfo.item1,
        handler: requestInfo.item2,
        newAccessToken: newToken,
      ),
    ));
  }

  void _onRefreshTokenError(Object? error) {
    for (final element in _queue) {
      final options = element.item1;
      element.item2.next(DioException(requestOptions: options, error: error));
    }
  }

  Future<void> _requestWithNewToken({
    required RequestOptions options,
    required ErrorInterceptorHandler handler,
    required String newAccessToken,
  }) async {
    _putAccessToken(headers: options.headers, accessToken: newAccessToken);

    try {
      final response = await _noneAuthAppServerApiClient.dio.fetch(options);
      handler.resolve(response);
    } catch (e) {
      handler.next(DioException(requestOptions: options, error: e));
    }
  }
}
