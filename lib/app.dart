import 'package:basic_requirements_package/core/init/cache/onboarding/intro_caching.dart';
import 'package:basic_requirements_package/core/init/cubit/theme_cubit.dart';
import 'package:basic_requirements_package/core/init/theme/dark/dark_theme_custom.dart';
import 'package:basic_requirements_package/core/init/theme/light/light_theme_custom.dart';
import 'package:basic_requirements_package/view/introduction/view/introduction_screen.dart';
import 'package:basic_requirements_package/view/settings/view/setting_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: IntroCaching.initialIntro(),
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => Introduction.intro,
    ),
    GoRoute(
      path: '/setting',
      builder: (context, state) => const SettingView(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeState) {
        return MaterialApp.router(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          theme: LightThemeCustom().theme,
          darkTheme: DarkThemeCustom().theme,
          themeMode: themeState,
          // home: const SettingView(),
          // home: Introduction.intro,
          // home: IntroCaching.initialIntro(),
          routerConfig: router,
        );
      },
    );
  }
}
