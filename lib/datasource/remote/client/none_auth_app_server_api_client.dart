import 'package:dio/dio.dart';

import '../../../shared/constant/url_constants.dart';
import '../middleware/header_interceptor.dart';
import 'base/app_rest.dart';
import 'base/dio_builder.dart';

class NoneAuthAppServerApiClient extends RestApiClient {
  NoneAuthAppServerApiClient(HeaderInterceptor headerInterceptor)
      : super(
          dio: DioBuilder.createDio(
            options: BaseOptions(baseUrl: UrlConstants.appApiBaseUrl),
            interceptors: [
              headerInterceptor,
            ],
          ),
        );
}
