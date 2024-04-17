import 'package:dio/dio.dart';

import '../definition/strings.dart';

class ApiService {
  final Dio _dio;
  ApiService(this._dio);

  Future<Response> getToken() {
    return _dio.get(AppStrings.loginEndpoint);
  }
}
