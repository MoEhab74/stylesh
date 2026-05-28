import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylesh/core/api/api_interceptors.dart';
import 'package:stylesh/core/cache/cache_helper.dart';
import 'package:stylesh/core/cache/secure_cache_helper.dart';
import 'package:stylesh/core/routing/app_router.dart';
import 'package:stylesh/core/routing/app_routes.dart';
import 'package:stylesh/core/services/get_it_sevice.dart';
import 'package:stylesh/core/services/is_logged_in_service.dart';
import 'package:stylesh/core/services/onboarding_service.dart';
import 'package:stylesh/core/utils/app_theme.dart';
import 'package:stylesh/generated/l10n.dart';

void main() async {
  // Make sure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize GetIt
  setupGetIt();
  // Initialize CacheHelper
  await getit<CacheHelper>().initCacheHelper();
  // Initialize SecureCacheHelper
  getit<SecureCacheHelper>().initSecureCacheHelper();

  // 2. Initialize your OnboardingService & Check first visit
  final onboardingService = getit<OnboardingService>();
  final bool isFirstVisit = await onboardingService.isFirstVisit();

  // 2. Initialize your IsLoggedInService & Check login status
  final isLoggedInService = getit<IsLoggedInService>();
  final bool isLoggedIn = await isLoggedInService.isLoggedIn();

  // 3. Setup the AppRouter synchronously using the boolean result
  AppRouter.setupRouter(isFirstVisit: isFirstVisit, isLoggedIn: isLoggedIn);

  runApp(const Stylesh());
}

class Stylesh extends StatefulWidget {
  const Stylesh({super.key});

  @override
  State<Stylesh> createState() => _StyleshState();
}

class _StyleshState extends State<Stylesh> {
  late StreamSubscription<AuthEvent> _authEventSubscription;

  @override
  initState() {
    super.initState();
    // 4. Subscribe to the AuthEventBus to listen for logout events
    _authEventSubscription = AuthEventBus.instance.stream.listen((event) {
      if (event == AuthEvent.logout) {
        AppRouter.router.go(AppRoutes.login);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          locale: const Locale('en'),
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          title: 'Flutter Demo',
          theme: AppTheme.getlightTheme,
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}
