import 'package:cifo_flutter/core/constants/api.dart';
import 'package:dio/dio.dart';

import 'package:cifo_flutter/core/base/base_remote_data_source.dart';
import 'package:cifo_flutter/core/secure_storage/secure_storage.dart';

class AuthInterceptor extends Interceptor with BaseRemoteDataSourceImpl {
  final SecureStorage secureStorage;

  AuthInterceptor({
    required this.secureStorage,
  });

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.path == API.apiTransfer) {
      //Todo: change not to register
      try {
        final String cedula = await secureStorage.getSecuredUserToken();
        options.headers['cedula'] = cedula;
      } catch (e) {
        print("Errores: ");
        print(e);
        rethrow;
      }
      // final String bearerToken = await secureStorage.getBearerToken;
      // options.headers['Authorization'] = 'Bearer $bearerToken';
    }

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.requestOptions.path == API.apiLogIn) {
      await secureStorage.secureUserToken(tokenToSecure: response.data[""]);
    }
    super.onResponse(response, handler);
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    print(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}',
    );
    super.onError(err, handler);
  }
}
