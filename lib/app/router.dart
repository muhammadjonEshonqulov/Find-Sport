import 'package:find_sport/features/choose_language/page/choose_language_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/add_new/page/add_new_screen.dart';
import '../features/signup/page/signup_screen.dart';
import '../features/splash/page/splash_screen.dart';

abstract final class Routes {
  static const splash = '/nav_splash';
  static const signup = '/nav_signup';
  static const add_new = '/nav_add_new';
  static const choose_language = '/nav_choose_language';

  static const baseUrl = "$baseUrlImage/v2/api/";
  static const baseUrlImage = "https://";
}

final router = GoRouter(
  initialLocation: Routes.add_new,
  routes: [
    GoRoute(
      path: Routes.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: Routes.signup,
      builder: (context, state) => const SignupPageWithRepo(),
    ),
    GoRoute(
      path: Routes.choose_language,
      builder: (context, state) => const ChooseLanguageScreen(),
    ),
    GoRoute(
      path: Routes.add_new,
      builder: (context, state) => const AddNewPageWithRepo(),
    ),
  ],
);

void finish(BuildContext context) {
  Navigator.of(context).pop();
}
