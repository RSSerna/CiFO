import 'package:cifo_flutter/core/constants/constants.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:cifo_flutter/core/usecase/usecase.dart';
import 'package:cifo_flutter/features/fileManager/data/models/file_model.dart';
import 'package:cifo_flutter/features/fileManager/domain/usecase/authenticate_file.dart';
import 'package:cifo_flutter/features/fileManager/domain/usecase/delete_file.dart';
import 'package:cifo_flutter/features/fileManager/domain/usecase/get_files.dart';

part 'files_manager_event.dart';
part 'files_manager_state.dart';

class FileManagerBloc extends Bloc<FileManagerEvent, FileManagerState> {
  final AuthenticateFile authenticateFile;
  final DeleteFile deleteFile;
  final GetFiles getFiles;

  FileManagerBloc({
    required this.authenticateFile,
    required this.deleteFile,
    required this.getFiles,
  }) : super(FileManagerInitialState()) {
    on<AuthenticateFileEvent>((event, emit) async {
      emit(FileManagerLoadingState(filesModel: event.files));

      final failureOrAccepted = await authenticateFile(FileModel(
          id: event.id, fileName: 'fileName', isValid: true, url: ''));

      failureOrAccepted.fold((error) {
        emit(FileManagerErrorState(
            filesModel: event.files,
            errorMessage: Constants.errorAuthenticate));
      }, (accepted) {
        emit(FileManagerAcceptedState(
            filesModel: event.files, message: Constants.acceptedAuthenticate));
      });

      emit(FileManagerPreviewState(filesModel: event.files));
    });

    on<DeleteFileEvent>((event, emit) async {
      emit(FileManagerLoadingState(filesModel: event.files));

      final failureOrAccepted = await deleteFile(FileModel(
        id: event.id,
        fileName: 'fileName',
        isValid: true,
        url: '',
      ));

      failureOrAccepted.fold((error) {
        emit(FileManagerErrorState(
            filesModel: event.files, errorMessage: Constants.errorDelete));
      }, (accepted) {
        emit(FileManagerAcceptedState(
            filesModel: event.files, message: Constants.acceptedDelete));
      });

      emit(FileManagerPreviewState(filesModel: event.files));
    });
    on<GetFilesEvent>((event, emit) async {
      emit(FileManagerLoadingState(filesModel: event.files));

      final failureOrAccepted = await getFiles(NoParams());

      failureOrAccepted.fold((error) {
        emit(FileManagerErrorState(
            filesModel: event.files, errorMessage: Constants.errorGetFiles));
      }, (accepted) {
        emit(FileManagerPreviewState(filesModel: accepted));
      });
    });
  }
}
