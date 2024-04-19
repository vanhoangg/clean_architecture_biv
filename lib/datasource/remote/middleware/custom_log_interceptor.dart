import 'package:clean_architecture_biv/shared/mixin/log_mixin.dart';
import 'package:dio/dio.dart';

import '../../../shared/config/log_config.dart';
import '../../../shared/util/function/app_log_util.dart';
import 'base_interceptor.dart';

class CustomLogInterceptor extends BaseInterceptor with LogMixin {
  CustomLogInterceptor({
    this.enableLogRequestInfo = LogConfig.enableLogRequestInfo,
    this.enableLogSuccessResponse = LogConfig.enableLogSuccessResponse,
    this.enableLogErrorResponse = LogConfig.enableLogErrorResponse,
  });

  final bool enableLogRequestInfo;
  final bool enableLogSuccessResponse;
  final bool enableLogErrorResponse;

  static const _enableLogInterceptor = LogConfig.enableLogInterceptor;

  @override
  int get priority => BaseInterceptor.customLogPriority;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (!_enableLogInterceptor || !enableLogRequestInfo) {
      handler.next(options);

      return;
    }

    final log = <String>[
      '************ Request ************',
      '🌐 Request: ${options.method} ${options.uri}'
    ];
    if (options.headers.isNotEmpty) {
      log
        ..add('🌐 Request Headers:')
        ..add('🌐 ${_prettyResponse(options.headers)}');
    }

    if (options.data != null) {
      log.add('🌐 Request Body:');
      if (options.data is FormData) {
        final data = options.data as FormData;
        if (data.fields.isNotEmpty) {
          log.add('🌐 Fields: ${_prettyResponse(data.fields)}');
        }
        if (data.files.isNotEmpty) {
          log.add(
            '🌐 Files: ${_prettyResponse(data.files.map((e) => MapEntry(e.key, 'File name: ${e.value.filename}, Content type: ${e.value.contentType}, Length: ${e.value.length}')))}',
          );
        }
      } else {
        log.add('🌐 ${_prettyResponse(options.data)}');
      }
    }

    logD(log.join('\n'));
    handler.next(options);
  }

  @override
  void onResponse(
      Response<dynamic> response, ResponseInterceptorHandler handler) {
    if (!_enableLogInterceptor || !enableLogSuccessResponse) {
      handler.next(response);

      return;
    }

    final log = <String>[
      '************ Request Response ************',
      '🎉 ${response.requestOptions.method} ${response.requestOptions.uri}',
      '🎉 Request Body: ${_prettyResponse(response.requestOptions.data)}',
      '🎉 Success Code: ${response.statusCode}',
      '🎉 ${_prettyResponse(response.data)}'
    ];

    logD(log.join('\n'));
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (!_enableLogInterceptor || !enableLogErrorResponse) {
      handler.next(err);

      return;
    }

    final log = <String>[
      '************ Request Error ************',
      '⛔️ ${err.requestOptions.method} ${err.requestOptions.uri}',
      '⛔️ Error Code: ${err.response?.statusCode ?? 'unknown status code'}',
      '⛔️ Json: ${err.response}'
    ];

    logD(log.join('\n'));
    handler.next(err);
  }

  // ignore: avoid-dynamic
  String _prettyResponse(dynamic data) {
    if (data is Map) {
      return Log.prettyJson(data as Map<String, dynamic>);
    }

    return data.toString();
  }
}
