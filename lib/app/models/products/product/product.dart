import 'package:beep_mobile/base/models/product.dart';
import 'package:hive/hive.dart';
part 'product.g.dart';

@HiveType(typeId: 20)
class Product extends ProductBaseModel with HiveObjectMixin {
  @HiveField(0)
  String? codeBarre;
  @HiveField(1)
  String? nomFr;
  @HiveField(2)
  String? nomAr;
  @HiveField(3)
  String? reference;
  @HiveField(4)
  String? image;
  @HiveField(5)
  int? idCategorie;
  @HiveField(6)
  int? idUnite;
  Product();

  Product.fromJson(Map<String, dynamic> json) {
    codeBarre = json['Code_Barre'];
    nomFr = json['nomFr'];
    nomAr = json['nomAr'];
    reference = json['Reference'];
    image = json['image'];
    idCategorie = json['id_categorie'];
    idUnite = json['id_unite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Code_Barre'] = codeBarre;
    data['nomFr'] = nomFr;
    data['nomAr'] = nomAr;
    data['Reference'] = reference;
    data['image'] = image;
    data['id_categorie'] = idCategorie;
    data['id_unite'] = idUnite;
    return data;
  }
}
