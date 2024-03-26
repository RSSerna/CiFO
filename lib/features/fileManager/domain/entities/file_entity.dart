import 'package:equatable/equatable.dart';

class FileEntity extends Equatable {
  final String id;
  final String fileName;
  final String url;
  final bool isValid;

  const FileEntity({
    required this.id,
    required this.fileName,
    required this.url,
    required this.isValid,
  });

  @override
  List<Object?> get props => [id,fileName, url, isValid];
}
