import 'dart:async';
import 'dart:convert';

import 'package:beep_mobile/app/models/api_response/api_response.dart';
import 'package:beep_mobile/app/models/token/token.dart';
import 'package:beep_mobile/app/models/user/user.dart';
import 'package:beep_mobile/app/services/local/token.dart';
import 'package:beep_mobile/app/services/remote/token.dart';
import 'package:beep_mobile/base/services/token.dart';
import 'package:beep_mobile/utils/api/urls.dart';
import 'package:http/http.dart' as http;

class UserService extends BaseTokenService {
  Future<User?> getUserData() async {
    Token? token = await TokenService().getToken();
    if (token != null) {
      final url = DataApi.userData;
      try {
        final response = await http.get(
          Uri.parse(url),
          headers: {
            "content-type": "application/json",
            "accept": "application/json",
            'Authorization': "Bearer " + token.accessToken!,
          },
        ).timeout(const Duration(seconds: 10), onTimeout: () {
          throw TimeoutException(
              'The connection has timed out, Please try again!');
        });
        if (response.statusCode.toString() == "200") {
          final responseData =
              json.decode(response.body) as Map<String, dynamic>;

          User user = User.fromJson(responseData);
          return user;
        }
        print(response.body);
        return null;
      } catch (error) {
        rethrow;
      }
    } else {
      return null;
    }
  }

  Future<ApiResponse?> updatePassword(
      String oldPassword, String newPassword) async {
    Token? token = await TokenLocalService().getUserToken();
    if (token != null) {
      final url = SecurityApi.updatePassword;
      try {
        final response = await http.post(
          Uri.parse(url),
          headers: {
            "content-type": "application/json",
            "accept": "application/json",
            'Authorization': "Bearer " + token.accessToken!,
          },
          body: json.encode(
            {
              "oldPassword": oldPassword,
              "newPassword": newPassword,
              "exitAllUsers": "1"
            },
          ),
        );

        final responseData = json.decode(response.body) as Map<String, dynamic>;
        var api = ApiResponse.fromJson(response);
        if (response.statusCode.toString() == "200") {
          token = Token.fromJson(responseData);

          await TokenLocalService().saveUserToken(token);
          return api;
        } else {
          return api;
        }
      } catch (error) {
        rethrow;
      }
    } else {
      return null;
    }
  }

  Future<ApiResponse?> updateInfo(
      String firstNameAr, String lastNameAr, String email) async {
    Token? token = await TokenLocalService().getUserToken();
    if (token != null) {
      final url = SecurityApi.updateProfile;
      try {
        final response = await http.post(
          Uri.parse(url),
          headers: {
            "content-type": "application/json",
            "accept": "application/json",
            'Authorization': "Bearer " + token.accessToken!,
          },
          body: json.encode({
            "email": email,
            "nomArabe": lastNameAr,
            "prenomArab": firstNameAr
          }),
        );

        final responseData = json.decode(response.body) as Map<String, dynamic>;
        var api = ApiResponse.fromJson(response);
        if (response.statusCode.toString() == "200") {
          var api = ApiResponse.fromJson(response);

          return api;
        } else {
          return api;
        }
      } catch (error) {
        rethrow;
      }
    } else {
      return null;
    }
  }

  Future<int?> sendNewPhoneNumber(String newPhoneNumber, String keyApp) async {
    Token? token = await TokenLocalService().getUserToken();
    if (token != null) {
      final url = SecurityApi.sendSMSConfirmation;
      try {
        final response = await http.post(
          Uri.parse(url),
          headers: {
            "content-type": "application/json",
            "accept": "application/json",
            'Authorization': "Bearer " + token.accessToken!,
          },
          body: json.encode(
            {"numtel": newPhoneNumber, "keyApp": keyApp},
          ),
        );

        final responseData = json.decode(response.body) as Map<String, dynamic>;
        if (response.statusCode.toString() == "200") {
          return responseData['delais'];
        } else {
          print(response.body);
          return -1;
        }
      } catch (error) {
        rethrow;
      }
    } else {
      return null;
    }
  }

  Future<ApiResponse?> confirmOTPPhoneNumber(String smsCode) async {
    Token? token = await TokenLocalService().getUserToken();
    if (token != null) {
      final url = SecurityApi.updatePhone;
      try {
        final response = await http.post(
          Uri.parse(url),
          headers: {
            "content-type": "application/json",
            "accept": "application/json",
            'Authorization': "Bearer " + token.accessToken!,
          },
          body: json.encode(
            {"code": smsCode},
          ),
        );

        var api = ApiResponse.fromJson(response);

        return api;
      } catch (error) {
        rethrow;
      }
    } else {
      return null;
    }
  }
}
