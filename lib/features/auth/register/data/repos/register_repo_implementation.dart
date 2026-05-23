import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:stylesh/core/api/api_consumer.dart';
import 'package:stylesh/core/api/api_endpoints.dart';
import 'package:stylesh/core/errors/error_model.dart';
import 'package:stylesh/core/errors/server_exception.dart';
import 'package:stylesh/features/auth/register/data/models/user_model.dart';
import 'package:stylesh/features/auth/register/data/repos/register_repo.dart';

class RegisterRepoImplementation implements RegisterRepo {
  final ApiConsumer apiConsumer;
  RegisterRepoImplementation({required this.apiConsumer});

  @override
  Future<Either<ServerException, Map<String, dynamic>>> login({
    required String email,
    required String password,
  }) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<Either<ErrorModel, UserModel>> register({
    required String name,
    required String email,
    required String password,
    required String avatarURL,
  }) async {
    try {
      final response = await apiConsumer.post(
        ApiEndpoints.createUser,
        data: {
          'name': name,
          'email': email,
          'password': password,
          'avatar': avatarURL,
        },
      );
      final user = UserModel.fromJson(response);
      log('User registered successfully: ${user.name}');
      return Right(user);
    } catch (e) {
      return Left(ErrorModel(message: e.toString()));
    }
  }
}
