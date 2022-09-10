import 'dart:async';

import 'package:beep_mobile/app/models/commune/commune.dart';

import 'package:beep_mobile/app/models/token/token.dart';
import 'package:beep_mobile/app/services/remote/token.dart';
import 'package:beep_mobile/base/services/commune.dart';

import 'package:beep_mobile/utils/api/urls.dart';
import 'package:http/http.dart' as http;

class CommuneService extends BaseCommuneService {
  Future<List<Commune>?> getCommunes() async {
    Token? token = await TokenService().getToken();

    final url = DataApi.commune;
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
          'Authorization': "Bearer " + token!.accessToken!,
        },
      ).timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException(
            'The connection has timed out, Please try again!');
      });
      if (response.statusCode.toString() == "200") {
        List<Commune> communes = Commune().getListFromJson(response.body);
        return communes;
      }
      return null;
    } catch (error) {
      rethrow;
    }
  }
}
