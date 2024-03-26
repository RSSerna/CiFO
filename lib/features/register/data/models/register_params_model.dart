import 'dart:convert';

import 'package:cifo_flutter/features/register/domain/entities/register_params.dart';


class RegisterParamsModel extends RegisterParams {
  const RegisterParamsModel({
    required String name,
    required String lastName,
    required String email,
    required String cedula,
    required String password,
  }) : super(
          name: name,
          address: lastName,
          email: email,
          password: password,
          id:cedula,
        );

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "lastName": address,
      "email": email,
      "password": password,
      "cedula": id,
    };
  }

  String toJson() => jsonEncode(toMap());
}
