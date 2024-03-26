import 'package:cifo_flutter/core/di/injection_container.dart';
import 'package:cifo_flutter/features/fileManager/presentation/bloc/files_manager_bloc.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:js' as js;

class FileManagerScreen extends StatelessWidget {
  const FileManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FileManagerBloc fileManagerBloc =
        InjectionContainerImpl().sl.get<FileManagerBloc>();
    return BlocConsumer<FileManagerBloc, FileManagerState>(
      bloc: fileManagerBloc..add(const GetFilesEvent(filesModel: [])),
      listener: (context, state) {
        if (state is FileManagerLoadingState) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return const AlertDialog(
                backgroundColor: Colors.transparent,
                contentPadding: EdgeInsets.zero,
                content: Center(
                  child: CircularProgressIndicator(),
                ),
                surfaceTintColor: Colors.transparent,
              );
            },
          );
        } else if (state is FileManagerAcceptedState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              width: 200,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              behavior: SnackBarBehavior.floating,
              content: Text(state.message),
            ),
          );
          Navigator.pop(context);
        } else if (state is FileManagerErrorState) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Hubo un error'),
                content: Text(state.errorMessage),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cerrar'),
                  ),
                ],
              );
            },
          );
        }
        if (state is FileManagerInitialState ||
            state is FileManagerPreviewState) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        if (state is FileManagerInitialState ||
            // state is FileManagerLoadingState ||
            state is FileManagerPreviewState) {
          return Scaffold(
              appBar: AppBar(
                  // title: const Text('FileManagerScreen'),
                  ),
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              body: ListView(
                children: [
                  ...state.files.map((file) => Card(
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                print("Borrar");
                                // context.read<FileManagerBloc>().add(
                                //       DeleteFileEvent(
                                //           filesModel: state.files,
                                //           id: file.id));
                              },
                              icon: const Icon(Icons.delete),
                              tooltip: "Borrar Documento",
                            ),
                            IconButton(
                              onPressed: () async {
                                js.context.callMethod('open', [file.url]);
                              },
                              icon: const Icon(Icons.remove_red_eye),
                              tooltip: "Ver Documento ${file.url}",
                            ),
                            IconButton(
                              onPressed: () {
                                if (!file.isValid) {
                                  print("Autenticar");
                                  // context.read<FileManagerBloc>().add(
                                  //     AuthenticateFileEvent(
                                  //         filesModel: state.files,
                                  //         id: file.id));
                                }
                              },
                              icon: Icon(file.isValid
                                  ? Icons.check_circle_outline
                                  : Icons.highlight_off),
                              tooltip: file.isValid
                                  ? "Documento Ya Autenticado"
                                  : "Autenticar Documento",
                            ),
                            Text(file.fileName)
                          ],
                        ),
                      ))
                ],
              ));
        } else {
          return Container();
        }
      },
    );
  }
}
