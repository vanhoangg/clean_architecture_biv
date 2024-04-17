import 'package:dio/dio.dart';

abstract class AuthenticationRepository {
  Future<Response> getData();
}
