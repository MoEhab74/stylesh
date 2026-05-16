import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:stylesh/core/routing/app_routes.dart';
import 'package:stylesh/features/auth/forget_password/presentation/cubit/forget_password_cubit.dart';
import 'package:stylesh/features/auth/forget_password/presentation/views/forget_password_view.dart';
import 'package:stylesh/features/auth/login/presentation/cubit/login_cubit.dart';
import 'package:stylesh/features/auth/login/presentation/views/login_view.dart';
import 'package:stylesh/features/auth/signup/presentation/cubit/register_cubit.dart';
import 'package:stylesh/features/auth/signup/presentation/views/register_view.dart';
import 'package:stylesh/features/onboarding/presentation/onboarding_view.dart';
import 'package:stylesh/features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static final router = GoRouter(
    initialLocation: AppRoutes.onBoarding,
    routes: [
      GoRoute(
        path: AppRoutes.splash,
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: AppRoutes.onBoarding,
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(
        path: AppRoutes.login,
        builder: (context, state) => BlocProvider(
          create: (context) => LoginCubit(),
          child: const LoginView(),
        ),
      ),
      GoRoute(
        path: AppRoutes.register,
        builder: (context, state) => BlocProvider(
          create: (context) => RegisterCubit(),
          child: const RegisterView(),
        ),
      ),
      GoRoute(
        path: AppRoutes.forgetPassword,
        builder: (context, state) => BlocProvider(
          create: (context) => ForgetPasswordCubit(),
          child: const ForgetPasswordView(),
        ),
      ),
    ],
  );
}
