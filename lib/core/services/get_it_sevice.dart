import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:stylesh/core/api/api_consumer.dart';
import 'package:stylesh/core/api/dio_consumer.dart';
import 'package:stylesh/core/cache/cache_helper.dart';
import 'package:stylesh/core/cache/secure_cache_helper.dart';
import 'package:stylesh/core/services/is_logged_in_service.dart';
import 'package:stylesh/core/services/onboarding_service.dart';
import 'package:stylesh/core/services/tokens_secure_service.dart';
import 'package:stylesh/features/auth/login/data/repos/login_repo.dart';
import 'package:stylesh/features/auth/login/data/repos/login_repo_implementation.dart';
import 'package:stylesh/features/auth/register/data/repos/register_repo.dart';
import 'package:stylesh/features/auth/register/data/repos/register_repo_implementation.dart';
import 'package:stylesh/features/home/data/repos/home_repo.dart';
import 'package:stylesh/features/home/data/repos/home_repo_implementation.dart';

final getit = GetIt.instance;

void setupGetIt() {
  // Register App repositories
  getit.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: Dio()));
  getit.registerLazySingleton<RegisterRepo>(
    () => RegisterRepoImplementation(apiConsumer: getit<ApiConsumer>()),
  );
  getit.registerLazySingleton<LoginRepo>(
    () => LoginRepoImplementation(
      apiConsumer: getit<ApiConsumer>(),
      tokenSecureService: getit<TokensSecureService>(),
      isLoggedInService: getit<IsLoggedInService>(),
    ),
  );
  getit.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(apiConsumer: getit<ApiConsumer>()),
  );
  // Register cache helpers
  getit.registerLazySingleton<CacheHelper>(() => CacheHelper());
  getit.registerLazySingleton<SecureCacheHelper>(() => SecureCacheHelper());
  getit.registerLazySingleton<OnboardingService>(
    () => OnboardingService(getit<CacheHelper>()),
  );
  getit.registerLazySingleton<IsLoggedInService>(
    () => IsLoggedInService(getit<CacheHelper>()),
  );
  getit.registerLazySingleton<TokensSecureService>(
    () => TokensSecureService(getit<SecureCacheHelper>()),
  );
}
