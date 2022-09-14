import 'dart:convert';

import 'package:beep_mobile/base/models/unite.dart';
import 'package:hive/hive.dart';

part 'unite.g.dart';

@HiveType(typeId: 22)
class Unite extends UniteBaseModel with HiveObjectMixin {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? nomAr;
  @HiveField(2)
  String? nomFr;
  @HiveField(3)
  String? abreviation;

  Unite();
  Unite.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    id = json["id"];
    nomAr = json["nomAr"];
    nomFr = json["nomFr"];
    abreviation = json["abreviation"];
  }

  List<Unite> getListFromJson(String jsonlist) {
    return (json.decode(jsonlist) as List)
        .map((data) => Unite.fromJson(data))
        .toList();
  }

  Future<void> setUnite(Unite unite) async {
    id = unite.id;
    nomAr = unite.nomAr;
    nomFr = unite.nomFr;
    abreviation = unite.abreviation;
  }
}
