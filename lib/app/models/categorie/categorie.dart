import 'dart:convert';

import 'package:beep_mobile/base/models/categorie.dart';
import 'package:get/get.dart';

class Categorie extends CategorieBaseModel {
  Categorie();
  Categorie.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    // code = json["centre"].toString();
  }

  List<Categorie> getListFromJson(String jsonlist) {
    return (json.decode(jsonlist) as List)
        .map((data) => Categorie.fromJson(data))
        .toList();
  }

  Future<void> setCategorie(Categorie categorie) async {}
}
