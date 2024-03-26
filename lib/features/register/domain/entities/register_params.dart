import 'package:equatable/equatable.dart';

class RegisterParams extends Equatable {
  final String name;
  final String address;
  final String email;
  final String password;
  final String id;

  const RegisterParams({
    required this.name,
    required this.address,
    required this.email,
    required this.password,
    required this.id,
  });

  @override
  List<Object> get props => [name, address, email, password, id];
}
