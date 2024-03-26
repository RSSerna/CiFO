import 'package:cifo_flutter/core/errors/failures.dart';
import 'package:cifo_flutter/features/signin/domain/entities/sign_in_entity.dart';
import 'package:cifo_flutter/features/signin/domain/entities/sign_in_response.dart';
import 'package:dartz/dartz.dart';


abstract class SignInRepository {
  Future<Either<Failure, SignInResponse>> signInUser(SignInEntity signInEntity);
}
