import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:stylesh/core/api/api_consumer.dart';
import 'package:stylesh/core/api/dio_consumer.dart';
import 'package:stylesh/features/auth/register/data/repos/register_repo.dart';
import 'package:stylesh/features/auth/register/data/repos/register_repo_implementation.dart';

final getit = GetIt.instance;

void setupGetIt() {
  getit.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: Dio()));
  getit.registerLazySingleton<RegisterRepo>(
    () => RegisterRepoImplementation(apiConsumer: getit<ApiConsumer>()),
  );
}
