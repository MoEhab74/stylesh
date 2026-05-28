import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:stylesh/core/api/api_consumer.dart';
import 'package:stylesh/core/api/api_endpoints.dart';
import 'package:stylesh/core/errors/error_model.dart';
import 'package:stylesh/core/services/is_logged_in_service.dart';
import 'package:stylesh/core/services/tokens_secure_service.dart';
import 'package:stylesh/features/auth/login/data/models/login_model.dart';
import 'package:stylesh/features/auth/login/data/repos/login_repo.dart';

class LoginRepoImplementation implements LoginRepo {
  final ApiConsumer apiConsumer;
  final TokensSecureService tokenSecureService;
  final IsLoggedInService isLoggedInService;

  LoginRepoImplementation({
    required this.apiConsumer,
    required this.tokenSecureService,
    required this.isLoggedInService,
  });
  @override
  Future<Either<ErrorModel, LogInModel>> logIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await apiConsumer.post(
        ApiEndpoints.login,
        data: {'email': email, 'password': password},
      );
      final loginModel = LogInModel.fromJson(response);
      final accsssessToken = loginModel.accessToken;
      final refreshToken = loginModel.refreshToken;
        await tokenSecureService.saveTokens(
          accessToken: accsssessToken,
          refreshToken: refreshToken,
        );
        await isLoggedInService.setLoggedIn(true);
        log('User logged in successfully');
      return Right(loginModel);       
    } catch (e) {
      return Left(ErrorModel(message: e.toString()));
    }
  }
}
