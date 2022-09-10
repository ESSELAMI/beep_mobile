import 'dart:convert';

import 'package:beep_mobile/app/models/token/token.dart';
import 'package:beep_mobile/app/services/local/token.dart';
import 'package:beep_mobile/app/services/remote/auth.dart';
import 'package:beep_mobile/base/services/user.dart';

class TokenService extends BaseUserService {
  Future<Token?> getToken() async {
    Token? token = await TokenLocalService().getUserToken();
    if (token != null) {
      if (token.expiryDate!.isBefore(DateTime.now())) {
        final Auth auth = Auth();
        final response = await auth.getNewAccessToken(token.refreshToken!);
        final Map<String, dynamic> responseData =
            jsonDecode(response.body.toString());

        if (response.statusCode == "200") {
          token = Token.fromJson(responseData);
          await TokenLocalService().saveUserToken(token);
          return token;
        } else {
          return null;
        }
      }
      return token;
    } else {
      return null;
    }
  }
}
