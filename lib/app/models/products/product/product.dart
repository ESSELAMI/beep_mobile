class Product {
  String? codeBarre;
  String? nomFr;
  String? nomAr;
  String? reference;
  int? tva;
  int? idCategorie;
  int? idUnite;

  Product(
      {this.codeBarre,
      this.nomFr,
      this.nomAr,
      this.reference,
      this.tva,
      this.idCategorie,
      this.idUnite});

  Product.fromJson(Map<String, dynamic> json) {
    codeBarre = json['Code_Barre'];
    nomFr = json['nomFr'];
    nomAr = json['nomAr'];
    reference = json['Reference'];
    tva = json['tva'];
    idCategorie = json['id_categorie'];
    idUnite = json['id_unite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Code_Barre'] = codeBarre;
    data['nomFr'] = nomFr;
    data['nomAr'] = nomAr;
    data['Reference'] = reference;
    data['tva'] = tva;
    data['id_categorie'] = idCategorie;
    data['id_unite'] = idUnite;
    return data;
  }
}
