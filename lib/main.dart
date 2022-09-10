import 'package:beep_mobile/app/controllers/auth_controller.dart';
import 'package:beep_mobile/app/models/center/center.dart';
import 'package:beep_mobile/app/models/token/token.dart';
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
/**
* 
// ignore: todo
* !  check null values from api (add ?? "")
* * map filter userCenter 
* * familiy members (duplicate prescriptions)
* * health_ structures (model back end...)
* * map add back button
* * back button (physical) 
* * add call phone function
* * profile add center information

* * fix forget password
* * add agree terms (login and registration)

* ? handle errors (almost there)


* * add info when selecting image  (from camera and gallery in new sick Leave)
* * add verification (number of days in sick leave new)
* * Online requests (sick leave)
* * todo fix when sick leave request is sent (back to list or clear form)



* todo preoccupations
* todo contact us design

* todo Online requests (chifa card)


* todo edit health centers design (copy prescriptions..)
* todo edit profile design

  */

  await GetStorage.init();
  Get.lazyPut(() => AuthService());
  Get.lazyPut<AuthController>(() => AuthController());
  WidgetsFlutterBinding.ensureInitialized();
  // NotificationService().init();
  await Hive.initFlutter();
  Hive.registerAdapter(TokenAdapter());
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
}

Future<void> initialization(BuildContext context) async {
  Hive.registerAdapter(UserAdapter());

  Hive.registerAdapter(CentreAdapter());

  // NotificationService _notificationService = NotificationService();

  // PreoccupationService().getPreoccupations().then((value) => print(value));
  // UserLocalService().getUser().then((value) {
  //   IO.Socket socket = IO.io(
  //       'http://130.61.51.10:3006',
  //       OptionBuilder().setTransports(['websocket']) // for Flutter or Dart VM
  //           .setQuery({
  //         'userid': value!.noAssure.toString(),
  //         'username':
  //             value.firstName.toString() + ' ' + value.lastName.toString(),
  //         'type': 'mobile',
  //       }) // optional
  //           .build());
  //   socket.onConnect((_) {
  //     print('connect');
  //     // socket.emit('new user', 'test');
  //   });
  //   socket.on('notificationDialog', (data) {
  //     //notification
  //     _notificationService.showNotifications();
  //   });
  //   socket.on('customMessage', (data) {
  //     //notification
  //     _notificationService.showCustomNotifications(data);
  //   });
  //   socket.on(
  //       'new message', (data) => print("new message : " + data.toString()));
  //   socket.connect();

  //   socket.onDisconnect((_) => print('disconnect'));
  // });
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
