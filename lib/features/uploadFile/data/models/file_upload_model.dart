import 'dart:convert';
import 'dart:typed_data';

import 'package:cifo_flutter/features/uploadFile/domain/entities/file_upload_entity.dart';

class FileUploadModel extends FileUploadEntity {
  const FileUploadModel({
    required Uint8List fileBytes,
    required String fileName,
  }) : super(
          fileBytes: fileBytes,
          fileName: fileName,
        );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "fileBytes": fileBytes,
        "fileName": fileName,
      };

  factory FileUploadModel.fromMap(Map<String, dynamic> json) {
    return FileUploadModel(
      fileBytes: json["fileBytes"],
      fileName: json["fileName"],
    );
  }
}
