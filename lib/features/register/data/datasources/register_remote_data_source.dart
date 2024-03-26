import 'package:dio/dio.dart';

import 'package:cifo_flutter/core/constants/api.dart';
import 'package:cifo_flutter/core/http/custom_http_client.dart';
import 'package:cifo_flutter/features/register/data/models/register_params_model.dart';
import 'package:cifo_flutter/features/register/domain/entities/register_params.dart';

abstract class RegisterRemoteDataSource {
  Future<Response> registerUser({required RegisterParams registerParams});
}

class RegisterRemoteDataSourceImpl extends RegisterRemoteDataSource {
  final CustomHttpClient client;

  RegisterRemoteDataSourceImpl({required this.client});

  @override
  Future<Response> registerUser(
      {required RegisterParams registerParams}) async {
    Response response = Response(requestOptions: RequestOptions());

    return response;

    //TODO: Descomentar
    // final jsonData = await client.post(
    //   path: API.apiSignUp,
    //   body: RegisterParamsModel(
    //     name: registerParams.name,
    //     lastName: registerParams.lastName,
    //     email: registerParams.email,
    //     password: registerParams.password,
    //     cedula: registerParams.cedula,
    //   ).toJson(),
    // );
    // return jsonData;
  }
}
