import 'dart:async';
import 'dart:convert';

import 'package:beep_mobile/app/models/unite/unite.dart';
import 'package:beep_mobile/app/models/token/token.dart';
import 'package:beep_mobile/app/services/local/unite.dart';
import 'package:beep_mobile/app/services/remote/token.dart';
import 'package:beep_mobile/base/services/unite.dart';

import 'package:beep_mobile/utils/api/urls.dart';
import 'package:http/http.dart' as http;

class UniteService extends BaseUniteService {
  Future<List<Unite>?> getUnites() async {
    // Token? token = await TokenService().getToken();
    final url = "${UniteApi.unites}?size=80000";

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
          // 'Authorization': "Bearer " + token!.accessToken!,
        },
      ).timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException(
            'The connection has timed out, Please try again!');
      });
      if (response.statusCode.toString() == "200") {
        List<Unite> unites =
            Unite().getListFromJson(json.decode(response.body)["result"]);
        UniteLocalService().saveUnitesSecure(unites);
        print(unites);
        return unites;
      }
      return null;
    } catch (error) {
      rethrow;
    }
  }
}
