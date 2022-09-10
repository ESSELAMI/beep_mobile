import 'package:beep_mobile/base/models/wilaya.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'wilaya_list.dart' as jsonlist;

class Wilaya extends WilayaBaseModel {
  String? id;
  String? code;
  String? nomAr;
  String? nomFr;
  List<Wilaya>? wilayas;
  Wilaya();
  Wilaya.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    id = json["id"];
    code = json["code"];
    nomAr = json["nom"]['ar'].toString();
    nomFr = json["nom"]['fr'].toString();
  }

  List<Wilaya> getWilayas() {
    return (json.decode(jsonlist.wilaya) as List)
        .map((data) => Wilaya.fromJson(data))
        .toList();
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
