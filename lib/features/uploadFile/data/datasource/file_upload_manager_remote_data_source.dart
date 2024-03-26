import 'package:dio/dio.dart';

import 'package:cifo_flutter/features/uploadFile/data/models/file_upload_model.dart';
import 'package:cifo_flutter/core/constants/api.dart';
import 'package:cifo_flutter/core/http/custom_http_client.dart';


abstract class FileUploadManagerRemoteDataSource {
  Future<Response> uploadFile(FileUploadModel fileModel);
}

class FileUploadManagerRemoteDataSourceImpl
    implements FileUploadManagerRemoteDataSource {
  final CustomHttpClient client;

  FileUploadManagerRemoteDataSourceImpl({required this.client});

  @override
  Future<Response> uploadFile(FileUploadModel fileModel) async {
    // TODO: Uncomment
    // final jsonData =
        // await client.post(path: API.apiUploadFile, body: fileModel.toJson());
    Response jsonData = Response(requestOptions: RequestOptions());
    return jsonData;
  }
}
