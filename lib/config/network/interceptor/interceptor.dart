// interceptor.dart

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:test_gpt_application/config/env.dart';

import '../../../definition/definition.dart';
import '../../../datasource/local/error_local_data_source.dart';
import '../../../datasource/local/user_local_data_source.dart';
import '../../../util/app_log_util.dart';
import '../../../util/check_null_util.dart';
import '../../exception/error_response.dart';
import '../../exception/exception.dart';

class CommonInterceptor extends Interceptor {
  CommonInterceptor(
      this.env, this._userLocalDataSource, this._errorLocalDataSource);
  final Env env;
  final UserLocalDataSource _userLocalDataSource;
  final ErrorLocalDataSource _errorLocalDataSource;
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['accept'] = 'application/json';
    options.contentType = 'application/json';

    if (!EndPoint.listPathNotRequireToken.contains(options.path)) {
      final token = await _userLocalDataSource.getToken();
      options.headers['Authorization'] = 'Bearer $token';
    }

    // if (options.path == pathTimeout[0]) {
    //   options.connectTimeout = const Duration(seconds: 20);
    // }

    /// Log CURL
    AppLog.info('=>>>>>>> CURL:\n ${options.toCURL()}');

    handler.next(options);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    AppLog.error(
        'Failed request: \n Path: ${err.response?.requestOptions.path} \n Response: ${err.response?.data}');
    String? errorMessage = err.response?.data['message'];
    errorMessage ??= await _errorLocalDataSource.getMessageError(null);
    // if (isNotNull(err.response?.data['code'])) {
    //   errorMessage = await _errorLocalDataSource
    //       .getMessageError(err.response!.data['code']);
    // }

    final String? message = errorMessage;
    final statusCode = err.response?.statusCode ?? 500;

    if (err.error is BaseException) {
      handler.reject(DioException(
        requestOptions: err.requestOptions,
        response: err.response,
        type: DioExceptionType.unknown,
        error: err,
      ));
      return;
    }

    /// Not receive response from server, throw [NetworkException]
    // if (err.type != DioExceptionType.badResponse) {
    //   handler.reject(DioException(
    //     requestOptions: err.requestOptions,
    //     response: err.response,
    //     type: DioExceptionType.unknown,
    //     error: NetworkException(message: S.current.network_issue),
    //   ));
    //   return;
    // }
    handler.reject(DioException(
        requestOptions: err.requestOptions,
        response: err.response,
        type: DioExceptionType.unknown,
        error: ServerException(
            message: message ?? "Server error",
            statusCode: statusCode,
            errorResponse: ErrorResponse(
                code: statusCode, error: err, message: message))));
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // if (urlRequiredFullResponseData.contains(response.requestOptions.path)) {
    //   handler.next(Response(
    //     requestOptions: response.requestOptions,
    //     data: response.data,
    //     statusCode: response.statusCode,
    //     statusMessage: response.statusMessage,
    //     headers: response.headers,
    //     isRedirect: response.isRedirect,
    //     redirects: response.redirects,
    //     extra: response.extra,
    //   ));
    //   return;
    // }

    if (response.data is Map) {
      final data = (response.data as Map<String, dynamic>)[keyData];

      /// Log CURL
      AppLog.info('=>>>>>>> REsponse:\n ${data.toString()}');
      handler.next(Response(
        requestOptions: response.requestOptions,
        data: data,
        statusCode: response.statusCode,
        statusMessage: response.statusMessage,
        headers: response.headers,
        isRedirect: response.isRedirect,
        redirects: response.redirects,
        extra: response.extra,
      ));
    }
  }
}

extension RequestOptionsExts on RequestOptions {
  String toCURL() {
    var curl = '';
    // Add PATH + REQUEST_METHOD
    curl +=
        // ignore: lines_longer_than_80_chars
        'curl --request $method \'$uri\'';

    // Include headers
    for (final key in headers.keys) {
      curl += ' -H \'$key: ${headers[key]}\'';
    }
    // Include data if there is data
    if (isNotNull(data) && data is! FormData) {
      if (data is Map && (data as Map).isEmpty) {
      } else {
        curl += ' --data-binary \'${json.encode(data)}\'';
      }
    }
    curl += ' --insecure'; //bypass https verification
    return curl;
  }
}
