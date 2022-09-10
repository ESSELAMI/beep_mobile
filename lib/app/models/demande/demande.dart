import 'dart:convert';

import 'package:beep_mobile/base/models/demande.dart';
import 'package:get/get.dart';

class Demande extends DemandeBaseModel {
  Demande();
  Demande.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    // code = json["centre"].toString();
  }

  List<Demande> getListFromJson(String jsonlist) {
    return (json.decode(jsonlist) as List)
        .map((data) => Demande.fromJson(data))
        .toList();
  }

  Future<void> setDemande(Demande demande) async {}
}
