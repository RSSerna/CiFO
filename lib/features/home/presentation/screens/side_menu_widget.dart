import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cifo_flutter/features/home/presentation/bloc/transfer_bloc.dart';

class SideMenuWidget extends StatelessWidget {
  const SideMenuWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: BlocConsumer<TransferBloc, TransferState>(
      listener: (context, state) {
        if (state is TransferLoadingState) {
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
        } else if (state is TransferCompletedState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              width: 200,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              behavior: SnackBarBehavior.floating,
              content: const Text("Transferido correctamente"),
            ),
          );
          Navigator.pop(context);
        } else if (state is TransferErrorState) {
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
      },
      builder: (context, state) {
        if (state is TransferInitialState ||
            state is TransferLoadingState ||
            state is TransferErrorState) {
          return ListView(
            padding: EdgeInsets.zero,
            children: [
              const _DrawerHeader(),
              const ListTile(
                leading: Icon(Icons.account_box),
                title: Text('Home'),
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Salir'),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Cambio a 1'),
                onTap: () {
                  context.read<TransferBloc>().add(
                        const TransferUserEvent(transferID: '1'),
                      );
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Cambio a 2'),
                onTap: () {
                  context.read<TransferBloc>().add(
                        const TransferUserEvent(transferID: '2'),
                      );
                },
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Cambio a 3'),
                onTap: () {
                  context.read<TransferBloc>().add(
                        const TransferUserEvent(transferID: '3'),
                      );
                },
              ),
            ],
          );
        } else {
          return Container();
        }
      },
    ));
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //       image: AssetImage('assets/menu-img.jpg'), fit: BoxFit.cover),
        // ),
        child: Container());
  }
}
