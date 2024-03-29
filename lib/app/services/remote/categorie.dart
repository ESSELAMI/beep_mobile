import 'dart:async';
import 'dart:convert';

import 'package:beep_mobile/app/models/categorie/categorie.dart';
import 'package:beep_mobile/app/models/token/token.dart';
import 'package:beep_mobile/app/services/local/categorie.dart';
import 'package:beep_mobile/app/services/remote/token.dart';
import 'package:beep_mobile/base/services/categorie.dart';

import 'package:beep_mobile/utils/api/urls.dart';
import 'package:http/http.dart' as http;

class CategorieService extends BaseCategorieService {
  Future<List<Categorie>?> getCategories() async {
    // Token? token = await TokenService().getToken();
    final url = "${CategorieApi.categories}?size=80000";

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
        List<Categorie> categories =
            Categorie().getListFromJson(json.decode(response.body)["result"]);
        CategorieLocalService().saveCategoriesSecure(categories);
        print(categories);
        return categories;
      }
      return null;
    } catch (error) {
      rethrow;
    }
  }
}
