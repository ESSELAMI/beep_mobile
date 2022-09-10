import 'dart:convert';

import 'package:beep_mobile/base/models/center.dart';
import 'package:beep_mobile/utils/generated/locales.g.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

part 'center.g.dart';

@HiveType(typeId: 13)
class Centre extends CentreBaseModel with HiveObjectMixin {
  @HiveField(0)
  String? code;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String? address;
  @HiveField(3)
  String? phone;
  @HiveField(4)
  String? latitude;
  @HiveField(5)
  String? longitude;
  @HiveField(6)
  DateTime? lastCheck;

  Centre();
  Centre.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    code = json["centre"].toString();
    name = json["libelle"].toString();
    address = json["adresse"] ?? LocaleKeys.label_not_available.tr;
    phone = json["tel"] ?? LocaleKeys.label_not_available.tr;
    if (json["latLong"] != null) {
      var temp = json["latLong"].toString().split(",");
      latitude = temp[0];
      longitude = temp[1];
    }
  }

  List<Centre> getListFromJson(String jsonlist) {
    return (json.decode(jsonlist) as List)
        .map((data) => Centre.fromJson(data))
        .toList();
  }

  Future<void> setCentre(Centre centre) async {
    code = centre.code;
    name = centre.name;
  }
}
