import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stylesh/core/routing/app_router.dart';
import 'package:stylesh/core/utils/app_theme.dart';
import 'package:stylesh/generated/l10n.dart';

void main() {
  runApp(const Stylesh());
}

class Stylesh extends StatelessWidget {
  const Stylesh({super.key});

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
