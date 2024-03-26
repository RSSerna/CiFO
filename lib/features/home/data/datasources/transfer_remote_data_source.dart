import 'package:cifo_flutter/core/constants/api.dart';
import 'package:cifo_flutter/features/home/data/models/transfer_params_model.dart';
import 'package:dio/dio.dart';
import 'package:cifo_flutter/features/home/domain/entities/transfer_params.dart';
import 'package:cifo_flutter/core/http/custom_http_client.dart';

abstract class TransferRemoteDataSource {
  Future<Response> transferUser({required TransferParams transferParams});
}

class TransferRemoteDataSourceImpl extends TransferRemoteDataSource {
  final CustomHttpClient client;

  TransferRemoteDataSourceImpl({required this.client});

  @override
  Future<Response> transferUser(
      {required TransferParams transferParams}) async {
    Response response = Response(requestOptions: RequestOptions());

    // return response;

    //TODO: Descomentar
    final jsonData = await client.post(
      path: API.apiTransfer,
      body: TransferParamsModel(
        transferID: transferParams.transferID,
      ).toJson(),
    );

    print("This: " + jsonData.toString());
    return jsonData ;
  }
}
