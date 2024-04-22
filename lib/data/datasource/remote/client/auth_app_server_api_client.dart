import 'package:dio/dio.dart';

import '../../../../shared/constant/url_constants.dart';
import '../middleware/access_token_interceptor.dart';
import '../middleware/header_interceptor.dart';
import '../middleware/refresh_token_interceptor.dart';
import 'base/app_rest.dart';
import 'base/dio_builder.dart';

class AuthAppServerApiClient extends RestApiClient {
  AuthAppServerApiClient(
    HeaderInterceptor headerInterceptor,
    AccessTokenInterceptor accessTokenInterceptor,
    RefreshTokenInterceptor refreshTokenInterceptor,
  ) : super(
          dio: DioBuilder.createDio(
            options: BaseOptions(baseUrl: UrlConstants.appApiBaseUrl),
            interceptors: [
              headerInterceptor,
              accessTokenInterceptor,
              refreshTokenInterceptor,
            ],
          ),
        );
}
