import 'package:clean_architecture_biv/data/datasource/datasource.dart';

class AuthApiServices {
  AuthApiServices(this._userLocalDataSource);
  // final AuthAppServerApiClient _authAPiClient;
  final UserLocalDataSource _userLocalDataSource;
  Future<bool> login(
      {required String userName, required String passWord}) async {
    const String token = "cogv10hr01qj0pq31j2gcogv10hr01qj0pq31j30";
    return _userLocalDataSource.saveAccessToken(token);

    // try {
    //   final respone = await _authAPiClient
    //       .request<ApiRefreshTokenData, DataResponse<ApiRefreshTokenData>>(
    //     method: RestMethod.post,
    //     path: '/v1/auth/refresh',
    //     decoder: (json) =>
    //         ApiRefreshTokenData.fromJson(json as Map<String, dynamic>),
    //   );

    //   return respone;
    // } catch (e) {
    //   if (e is RemoteException &&
    //       (e.kind == RemoteExceptionKind.serverDefined ||
    //           e.kind == RemoteExceptionKind.serverUndefined)) {
    //     throw const RemoteException(
    //         kind: RemoteExceptionKind.refreshTokenFailed);
    //   }

    //   rethrow;
    // }
  }
}
