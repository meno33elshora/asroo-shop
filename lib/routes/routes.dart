import 'package:asroo/view/pages/welcome_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../logic/binding/app_binding.dart';
import '../view/pages/login_screen.dart';
import '../view/pages/sign_up_screen.dart';
import '../view/pages/splash_screen.dart';
import '../view/pages/theme_page.dart';
import '../view/test.dart';

class AppRoutes {
  static const splash = Routes.splashScreen;

  static final routes = [
    GetPage(name: Routes.splashScreen, page: () => const SplashScreen()),
    GetPage(name: Routes.theme, page: () => const ThemePage()),
    GetPage(name:  Routes.welcomeScreen, page: () => const WelcomeScreen()),
    GetPage(name: Routes.loginScreen, page: () =>  LoginScreen(),),
    GetPage(name: Routes.signUpScreen, page: () => const SignUpScreen(),),
    GetPage(name: Routes.test, page: () =>  Test()),
  ];
}

class Routes {
  static const String splashScreen = '/splash';
  static const String theme = '/theme';
  static const String welcomeScreen = '/welcome';
  static const String loginScreen = '/login';
  static const String signUpScreen = '/signup';
  static const String test = '/test';
}
