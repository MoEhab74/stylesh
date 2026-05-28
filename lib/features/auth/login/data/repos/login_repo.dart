import 'package:dartz/dartz.dart';
import 'package:stylesh/core/errors/error_model.dart';
import 'package:stylesh/features/auth/login/data/models/login_model.dart';

abstract class LoginRepo {

  Future<Either<ErrorModel, LogInModel>> logIn({
    required String email,
    required String password,
  });
}