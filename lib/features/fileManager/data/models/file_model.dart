import 'dart:convert';

import 'package:cifo_flutter/features/fileManager/domain/entities/file_entity.dart';

class FileModel extends FileEntity {
  const FileModel(
      {required String id,
      required String fileName,
      required String url,
      required bool isValid})
      : super(
          id: id,
          fileName: fileName,
          url: url,
          isValid: isValid
        );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "id": id,
        "fileName": fileName,
      };

  factory FileModel.fromMap(Map<String, dynamic> json) {
    return FileModel(
      id: json["id"],
      fileName: json["fileName"],
      url: json["url"],
      isValid: json["isValid"]
    );
  }
}
