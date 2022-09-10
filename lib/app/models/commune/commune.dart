import 'package:beep_mobile/base/models/wilaya.dart';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Commune extends WilayaBaseModel {
  String? wilayaCode;
  String? code;
  String? nomAr;
  String? nomFr;
  String? wilayaNameFr;
  String? wilayaNameAr;
  List<Commune>? communes;
  Commune();
  Commune.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    wilayaCode = json["codewilaya"];
    code = json["codecommune"];
    nomAr = json["libelleAr"].toString();
    nomFr = json["libelleFr"].toString();
  }
  List<Commune> getListFromJson(String jsonlist) {
    return (json.decode(jsonlist) as List)
        .map((data) => Commune.fromJson(data))
        .toList();
  }
  // Future<List<Commune>> getCommunes() async {
  //   final String response =
  //       await rootBundle.loadString('assets/json/commune.json');
  //   return (json.decode(response) as List)
  //       .map((data) => Commune.fromJson(data))
  //       .toList();
  // }

  List<Commune> getCommunes(String jsonlist) {
    return (json.decode(jsonlist) as List)
        .map((data) => Commune.fromJson(data))
        .toList();
  }

  Future<List<Commune?>> getCommunesWhere(String codeWilaya) async {
    final String response =
        await rootBundle.loadString('assets/json/commune.json');

    List<Commune> finallist = [];

    for (var data in json.decode(response) as List) {
      if (data["wilaya_code"].toString() == codeWilaya) {
        finallist.add(Commune.fromJson(data));
      }
    }
    return finallist;
  }

  @override
  String toString() {
    String name = "";
    Get.locale.toString() == "ar"
        ? name = nomAr.toString()
        : name = nomFr.toString();
    return name;
  }
}
