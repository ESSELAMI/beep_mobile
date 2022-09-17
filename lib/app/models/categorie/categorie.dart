import 'dart:convert';

import 'package:beep_mobile/base/models/categorie.dart';
import 'package:hive/hive.dart';

part 'categorie.g.dart';

@HiveType(typeId: 21)
class Categorie extends CategorieBaseModel with HiveObjectMixin {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? nomAr;
  @HiveField(2)
  String? nomFr;
  @HiveField(3)
  String? image;
  @HiveField(4)
  List<Categorie>? children;
  @HiveField(5)
  int? approved;
  Categorie();
  Categorie.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    id = json["id"];
    nomAr = json["nomAr"];
    nomFr = json["nomFr"];
    image = json["image"];
    approved = json["approved"];
    if (json["children"] != null) {
      children = <Categorie>[];
      json["children"].forEach((v) {
        children!.add(Categorie.fromJson(v));
      });
    }
  }

  List<Categorie> getListFromJson(List<dynamic> jsonlist) {
    return (jsonlist).map((data) => Categorie.fromJson(data)).toList();
  }

  Future<void> setCategorie(Categorie categorie) async {
    id = categorie.id;
    nomAr = categorie.nomAr;
    nomFr = categorie.nomFr;
    image = categorie.image;
    approved = categorie.approved;
    children = categorie.children;
  }

  @override
  String toString() {
    return 'Categorie{id: $id, nomAr: $nomAr, nomFr: $nomFr, image: $image, children: $children, approved: $approved}';
  }
}
