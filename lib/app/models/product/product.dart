import 'dart:convert';

import 'package:beep_mobile/app/models/categorie/categorie.dart';
import 'package:beep_mobile/app/models/unite/unite.dart';
import 'package:beep_mobile/base/models/product.dart';
import 'package:hive/hive.dart';
part 'product.g.dart';

@HiveType(typeId: 20)
class Product extends ProductBaseModel with HiveObjectMixin {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? codeBarre;
  @HiveField(2)
  String? nomFr;
  @HiveField(3)
  String? nomAr;
  @HiveField(4)
  String? reference;
  @HiveField(5)
  String? image;
  @HiveField(6)
  Categorie? categorie;
  @HiveField(7)
  Unite? unite;
  Product();

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    codeBarre = json['Code_Barre'];
    nomFr = json['nomFr'];
    nomAr = json['nomAr'];
    reference = json['Reference'];
    image = json['image'];
    categorie = json['categorie'];
    unite = json['unite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['Code_Barre'] = codeBarre;
    data['nomFr'] = nomFr;
    data['nomAr'] = nomAr;
    data['Reference'] = reference;
    data['image'] = image;
    data['id_categorie'] = categorie!.id;
    data['id_unite'] = unite!.id;
    return data;
  }

  List<Product> getListFromJson(List<dynamic> jsonlist) {
    return (jsonlist).map((data) => Product.fromJson(data)).toList();
  }

  @override
  String toString() {
    return 'Product{id: $id, codeBarre: $codeBarre, nomFr: $nomFr, nomAr: $nomAr, reference: $reference, image: $image, categorie: $categorie, unite: $unite}';
  }
}
