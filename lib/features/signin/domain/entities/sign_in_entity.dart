import 'package:equatable/equatable.dart';

class SignInEntity extends Equatable {
  final String email;
  final String cedula;

  const SignInEntity({required this.email, required this.cedula});

  @override
  List<Object> get props => [email, cedula];
}
