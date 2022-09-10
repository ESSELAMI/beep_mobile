import 'dart:async';
import 'dart:convert';

import 'package:beep_mobile/app/models/api_response/api_response.dart';
import 'package:beep_mobile/utils/api/urls.dart';
import 'package:http/http.dart' as http;

class Auth {
  static var client = http.Client();
  Future<ApiResponse> loginService(String username, String password) async {
    final response = await http.post(
      Uri.parse(SecurityApi.loginUrl),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
      },
      body: json.encode(
        {
          'username': username,
          'password': password,
        },
      ),
    );

    ApiResponse rst = ApiResponse.fromJson(response);
    return rst;
  }

  Future<ApiResponse> getNewAccessToken(String refreshToken) async {
    final response = await http.post(
      Uri.parse(SecurityApi.refreshToken),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
      },
      body: json.encode(
        {'refresh_token': "Bearer " + refreshToken},
      ),
    );
    ApiResponse rst = ApiResponse.fromJson(response);
    return rst;
  }

// Future<void> verifyUser(String username, String firstname, String lastname,
//       String birthdate, int presume) async {
//     _username = username;
//     _firstname = firstname;
//     _lastname = lastname;
//     _birthdate = birthdate;
//     _presume = presume;
//     final url = SecurityApi.searchUser;
//     try {
//       final response = await http
//           .post(
//         Uri.parse(url),
//         headers: {
//           "content-type": "application/json",
//           "accept": "application/json",
//         },
//         body: json.encode({
//           "numass": _username,
//           "nom": _firstname,
//           "prenom": _lastname,
//           "d_naiss": _birthdate,
//           "presume": _presume
//         }),
//       )
//           .timeout(const Duration(seconds: 10), onTimeout: () {
//         throw TimeoutException(
//             'The connection has timed out, Please try again!');
//       });
//       final responseData = json.decode(response.body) as Map<String, dynamic>;

//       if (responseData['error'] != null) {
//         throw HttpException(
//             responseData['error'] + ' ' + responseData['message']);
//       }

//     } catch (error) {
//       throw error;
//     }
//   }

  Future<ApiResponse> registerService(String username, String firstname,
      String lastname, String birthdate, int presume) async {
    final response = await http.post(
      Uri.parse(SecurityApi.searchUser),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
      },
      body: json.encode(
        {
          "numass": username,
          "nom": lastname.toUpperCase(),
          "prenom": firstname.toUpperCase(),
          "d_naiss": birthdate,
          "presume": presume
        },
      ),
    );
    ApiResponse rst = ApiResponse.fromJson(response);
    return rst;
  }

  Future<ApiResponse> confirmPhoneService(String username, String firstname,
      String lastname, String birthdate, int presume, String phone) async {
    final response = await http.post(
      Uri.parse(SecurityApi.confirmPhone),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
      },
      body: json.encode(
        {
          "numass": username,
          "nom": lastname.toUpperCase(),
          "prenom": firstname.toUpperCase(),
          "d_naiss": birthdate,
          "presume": presume,
          "numtel": phone
        },
      ),
    );
    ApiResponse rst = ApiResponse.fromJson(response);
    return rst;
  }

  Future<ApiResponse> verifyUser(String username, String firstname,
      String lastname, String birthdate, int presume) async {
    final response = await http.post(
      Uri.parse(SecurityApi.forgotPassword),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
      },
      body: json.encode(
        {
          "numass": username,
          "nom": lastname.toUpperCase(),
          "prenom": firstname.toUpperCase(),
          "d_naiss": birthdate,
          "presume": presume
        },
      ),
    );
    ApiResponse rst = ApiResponse.fromJson(response);
    return rst;
  }

  Future<ApiResponse> getSMSCode(
      String username,
      String firstname,
      String lastname,
      String birthdate,
      int presume,
      String phone,
      String password,
      String email,
      String appSignature) async {
    final response = await http.post(
      Uri.parse(SecurityApi.sendSmsCode),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
      },
      body: json.encode(
        {
          "numass": username,
          "nom": lastname.toUpperCase(),
          "prenom": firstname.toUpperCase(),
          "d_naiss": birthdate,
          "presume": presume,
          "pass": password,
          "email": email,
          "numtel": phone,
          "keyApp": appSignature
        },
      ),
    );
    ApiResponse rst = ApiResponse.fromJson(response);
    return rst;
  }

  Future<ApiResponse> completeRegistration(
      String username,
      String firstname,
      String lastname,
      String birthdate,
      int presume,
      String phone,
      String password,
      String email,
      String smsCode) async {
    final response = await http.post(
      Uri.parse(SecurityApi.registerUrl),
      headers: {
        "content-type": "application/json",
        "accept": "application/json",
      },
      body: json.encode(
        {
          "numass": username,
          "nom": lastname.toUpperCase(),
          "prenom": firstname.toUpperCase(),
          "d_naiss": birthdate,
          "presume": presume,
          "pass": password,
          "email": email,
          "numtel": phone,
          "smsCode": smsCode
        },
      ),
    );
    ApiResponse rst = ApiResponse.fromJson(response);

    return rst;
  }
}
