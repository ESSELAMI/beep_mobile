class SecurityApi {
  static String baseUrl = 'https://auth.beep_mobile.ml/api/';
  // 'http://10.236.1.242:8201/api/v1/';n
  static String loginUrl = '${baseUrl}login';
  static String registerUrl = '${baseUrl}registre';
  static String searchUser = '${baseUrl}ass';
  static String refreshToken = '${baseUrl}refreshTokens';
  static String sendSmsCode = '${baseUrl}sendSMS';
  static String updatePassword = '${baseUrl}hanaUsers/password/updatePassword';
  static String sendSMSConfirmation =
      '${baseUrl}hanaUsers/phone/sendSMSConfirmation';
  static String forgotPassword = '${baseUrl}hanaUsers/phone/number';
  static String updatePhone =
      '${baseUrl}hanaUsers/phone/update/confirmSMSPhone';
  static String confirmPhone = '${baseUrl}hanaUsers/password/sendPasswordSMS';
  static String updateProfile = '${baseUrl}profil/update';
}

class Urls {
  static String baseUrl = 'https://global.keaa.ml/api/';
}

class ProductApi {
  static String products = '${Urls.baseUrl}products';
  static String findProducts = '${Urls.baseUrl}findProduct';
  static String creatProduct = '${Urls.baseUrl}creatProduct';
  static String updateProductByCode = '${Urls.baseUrl}updateProductByCode';
  static String updateProductById = '${Urls.baseUrl}updateProductById';
  static String deleteProductById = '${Urls.baseUrl}deleteProductById';
  static String deleteProductByCode = '${Urls.baseUrl}updateProductById';
}

class CategorieApi {
  static String categories = '${Urls.baseUrl}categories';
  static String findCategorieByName = '${Urls.baseUrl}findCategorieByName';
  static String findCategorieById = '${Urls.baseUrl}findCategorieById';
  static String creatCategorie = '${Urls.baseUrl}creatCategorie';
  static String updateCategorieById = '${Urls.baseUrl}updateCategorieById';
  static String deleteCategorieById = '${Urls.baseUrl}deleteCategorieById';
}

class UniteApi {
  static String unites = '${Urls.baseUrl}unites';
  static String findUniteByName = '${Urls.baseUrl}findUniteByName';
  static String findUniteById = '${Urls.baseUrl}findUniteById';
  static String creatUnite = '${Urls.baseUrl}creatUnite';
  static String updateUniteById = '${Urls.baseUrl}updateUniteById';
  static String deleteUniteById = '${Urls.baseUrl}deleteUniteById';
}
