// import 'package:beep_mobile/app/services/local/check.dart';
import 'package:beep_mobile/app/services/local/token.dart';
import 'package:beep_mobile/app/services/local/user.dart';
import 'package:get/get.dart';
// import 'package:getx_flutter/app/services/local/token.dart';

class AuthService extends GetxService {
  static AuthService get to => Get.find();

  /// Mocks a login process
  final isLoggedIn = false.obs;
  final isFirst = false.obs;

  bool get isLoggedInValue => isLoggedIn.value;

  bool get isFirstValue => isFirst.value;

  void login() {
    isLoggedIn.value = true;
  }

  void logout() {
    isLoggedIn.value = false;
    TokenLocalService().clearUserToken();
    UserLocalService().clearUser();
    // CheckLocalLocalService().clearCheckLocal();
  }

  void setFirstTrue() {
    isFirst.value = true;
  }

  void setFirstFalse() {
    isLoggedIn.value = false;
  }
}
