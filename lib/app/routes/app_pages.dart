import 'package:beep_mobile/app/bindings/home.dart';
import 'package:beep_mobile/app/bindings/login.dart';
import 'package:beep_mobile/app/bindings/root_binding.dart';

import 'package:beep_mobile/app/bindings/splash.dart';
import 'package:beep_mobile/app/middlewares/auth_middleware.dart';
import 'package:beep_mobile/app/views/screens/auth/login/login.dart';

import 'package:beep_mobile/app/views/screens/home/home.dart';
import 'package:beep_mobile/app/views/screens/root/root_view.dart';
import 'package:beep_mobile/app/views/screens/splash/splash_screen.dart';
import 'package:get/get.dart';

part './app_routes.dart';

class AppPages {
  // ignore: constant_identifier_names
  static const INITIAL = Routes.LOGIN;

  static final pages = [
    GetPage(
      name: '/',
      page: () => RootView(),
      binding: RootBinding(),
      participatesInRootNavigator: true,
      preventDuplicates: true,
      children: [
        GetPage(
          // middlewares: [EnsureNotAuthedMiddleware()],
          name: Routes.Splash,
          page: () => SplashScreen(),
          binding: SplashBinding(),
        ),
        GetPage(
          middlewares: [EnsureAuthMiddleware()],
          name: Routes.HOME,
          page: () => HomeScreen(),
          binding: HomeBindings(),
        ),
        GetPage(
          middlewares: [EnsureNotAuthedMiddleware()],
          name: Routes.LOGIN,
          page: () => LoginScreen(),
          binding: LoginBinding(),
        ),
      ],
    ),
  ];
}
