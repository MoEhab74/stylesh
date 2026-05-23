import 'package:dartz/dartz.dart';
import 'package:stylesh/core/errors/error_model.dart';
import 'package:stylesh/core/errors/server_exception.dart';
import 'package:stylesh/features/auth/register/data/models/user_model.dart';

abstract class RegisterRepo {
  Future<Either<ErrorModel, UserModel>> register({
    required String name,
    required String email,
    required String password,
    required String avatarURL,
  });

  Future<Either<ServerException, Map<String, dynamic>>> login({
    required String email,
    required String password,
  });
}