import 'package:dio/dio.dart';
import 'package:cifo_flutter/core/constants/api.dart';
import 'package:cifo_flutter/core/http/custom_http_client.dart';
import 'package:cifo_flutter/features/fileManager/data/models/file_model.dart';
import 'package:cifo_flutter/features/fileManager/data/models/files_response_model.dart';

abstract class FileManagerRemoteDataSource {
  Future<List<FileModel>> getFiles();
  Future<Response> deleteFile(FileModel fileModel);
  Future<Response> authenticateFile(FileModel fileModel);
}

class FileManagerRemoteDataSourceImpl implements FileManagerRemoteDataSource {
  final CustomHttpClient client;

  FileManagerRemoteDataSourceImpl({required this.client});

  @override
  Future<List<FileModel>> getFiles() async {
    // final jsonData = await client.post(
    //   path: API.apiGetFiles,
    // );

    final Map<String, dynamic> jsonData = {
      "results": {
        {"id": "1", "fileName": "book1", "url": "https://www.google.com/", "isValid": true},
        {"id": "2", "fileName": "book2", "url": "www.google.com", "isValid": true},
        {"id": "3", "fileName": "book3", "url": "google.com", "isValid": false},
      }
    };
    return FilesResponseModel.fromSet(jsonData);
  }

  @override
  Future<Response> authenticateFile(FileModel fileModel) async {
    //TODO: Uncomment
    // final jsonData =
    //     await client.post(path: API.apiAuthFile, body: {"id": fileModel.id});

    Response jsonData = Response(requestOptions: RequestOptions());
    return jsonData;
  }

  @override
  Future<Response> deleteFile(FileModel fileModel) async {
    //TODO: Uncomment
    // final jsonData =
    //     await client.post(path: API.apiDeleteFile, body: {"id": fileModel.id});
    Response jsonData = Response(requestOptions: RequestOptions());
    return jsonData;
  }
}
