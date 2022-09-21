import 'package:beep_mobile/app/controllers/auth_controller.dart';
import 'package:beep_mobile/app/models/categorie/categorie.dart';
import 'package:beep_mobile/app/models/product/product.dart';
import 'package:beep_mobile/app/models/token/token.dart';
import 'package:beep_mobile/app/models/unite/unite.dart';
import 'package:beep_mobile/app/models/user/user.dart';
import 'package:beep_mobile/app/routes/app_pages.dart';
import 'package:beep_mobile/app/services/local/auth_service.dart';
import 'package:beep_mobile/app/services/local/locale_service.dart';
import 'package:beep_mobile/app/services/local/theme_service.dart';
import 'package:beep_mobile/app/services/local/token.dart';
import 'package:beep_mobile/utils/generated/locales.g.dart';
import 'package:beep_mobile/utils/theme/AppTheme.dart';
// import 'package:pos_mobile/utils/api/notificationsApi.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  await GetStorage.init();
  Get.lazyPut(() => AuthService());
  Get.lazyPut<AuthController>(() => AuthController());
  WidgetsFlutterBinding.ensureInitialized();
  // NotificationService().init();
  await Hive.initFlutter();
  Hive.registerAdapter(TokenAdapter());
  Hive.registerAdapter(ProductAdapter());
  Hive.registerAdapter(CategorieAdapter());
  Hive.registerAdapter(UniteAdapter());
  // if (OnBoardingService().first) {
  //   AuthService.to.setFirstTrue();
  //   OnBoardingService().switchOnBoarding();
  // } else {
  Token? token = await TokenLocalService().getUserToken();
  if (token != null) {
    AuthService.to.login();
  }
  // }
  FlutterNativeSplash.removeAfter(initialization);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });

  // ProductService()
  //     .getProducts()
  //     .then((value) => "ProductLocalService().saveProducts(value!)");
  // CategorieService().getCategories().then((value) => print(value!.length));
  // UniteService().getUnites().then((value) => print(value!.length));
}

Future<void> initialization(BuildContext context) async {
  Hive.registerAdapter(UserAdapter());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return (GetMaterialApp.router(
      translationsKeys: AppTranslation.translations,
      fallbackLocale: LocaleService().locale,
      locale: LocaleService().locale,
      debugShowCheckedModeBanner: false,
      initialBinding: BindingsBuilder(
        () {
          Get.put(AuthService());
        },
      ),
      getPages: AppPages.pages,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeService().theme,
      builder: EasyLoading.init(),
    ));
  }
}
