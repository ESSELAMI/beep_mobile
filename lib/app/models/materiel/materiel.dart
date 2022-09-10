import 'dart:convert';

import 'package:beep_mobile/base/models/materiel.dart';
import 'package:get/get.dart';

class Materiel extends MaterielBaseModel {
  Materiel();
  Materiel.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    // code = json["centre"].toString();
  }

  List<Materiel> getListFromJson(String jsonlist) {
    return (json.decode(jsonlist) as List)
        .map((data) => Materiel.fromJson(data))
        .toList();
  }

  Future<void> setMateriel(Materiel materiel) async {}
}
