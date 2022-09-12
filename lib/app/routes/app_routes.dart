// ignore_for_file: constant_identifier_names, non_constant_identifier_names

part of './app_pages.dart';

abstract class Routes {
  static const INITIAL = '/';
  static const HOME = '/home';
  static const LOGIN = '/login';
  static const Splash = '/splash';
  static const OnBoarding = '/onboarding';
  static const PRESCRIPTION = '/prescription';
  static const PRESCRIPTOR = '/prescriptor';
  static const FAMILYMEMBERS = '/familyMembers';
  static const SICKLEAVE = '/sickleave';
  static const OFFICINE = '/officine';
  static const QRCODE = '/qrCode';
  static const PROFILE = '/profile';
  static const REGISTER = '/register';
  static const COMPLETE_REGISTRATION = '/complete_registration';
  static const REGISTER_SUCCESS = '/register_success';
  static const OTP = '/otp';
  static const FORGOT_PASSWORD = '/forgot_password';
  static const MAP = '/map';
  static const HEALTH_STRUCTURE = '/health_structure';
  static const COMPLETE_PHONE_NUMBER = '/complete_phone_number';
  static const ONLINE_REQUESTS = '/online_requests';
  static const CONTACT = '/contact';
  static const QUESTIONS = '/questions';
  static const PREOCCUPATIONS = '/preoccupations';
  static const SCANNER = '/scanner';
  static String LOGIN_THEN(String afterSuccessfulLogin) =>
      '$LOGIN?then=${Uri.encodeQueryComponent(afterSuccessfulLogin)}';
}
