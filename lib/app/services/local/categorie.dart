import 'dart:convert';

import 'package:beep_mobile/app/models/categorie/categorie.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';

class CategorieLocalService {
  clearCategorie() async {
    try {
      final categorieBox = await Hive.openBox<Categorie>("categories");
      categorieBox.clear();
    } on Exception {
      throw Exception();
    }
  }

  Future<bool> saveCategorie(Categorie categorie) async {
    try {
      final categoriesBox = await Hive.openBox<Categorie>("categories");

      var p = categoriesBox.values
          .where((element) => categorie.nomFr == element.nomFr);
      if (p.isEmpty) {
        await categoriesBox.add(categorie);
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<bool> saveCategories(List<Categorie> categories) async {
    try {
      final categoriesBox = await Hive.openBox<Categorie>("categories");

      await categoriesBox.addAll(categories);
      return true;
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<bool> saveCategoriesSecure(List<Categorie> categories) async {
    try {
      const secureStorage = FlutterSecureStorage();
      // if key not exists return null
      final encryptionKey = await secureStorage.read(key: 'key');
      if (encryptionKey == null) {
        final key = Hive.generateSecureKey();
        await secureStorage.write(
          key: 'key',
          value: base64UrlEncode(key),
        );
      }
      final key1 = await secureStorage.read(key: 'key');
      final encryptionKey1 = base64Url.decode(key1!);

      final categoriesBox = await Hive.openBox<Categorie>("categories",
          encryptionCipher: HiveAesCipher(encryptionKey1));

      await categoriesBox.addAll(categories);
      categoriesBox.close();
      return true;
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<Categorie>?> getCategories() async {
    try {
      const secureStorage = FlutterSecureStorage();
      final key = await secureStorage.read(key: 'key');
      final encryptionKey = base64Url.decode(key!);

      final categoriesBox = await Hive.openBox<Categorie>("categories",
          encryptionCipher: HiveAesCipher(encryptionKey));

      if (categoriesBox.isNotEmpty) {
        List<Categorie> temp = categoriesBox.values.toList().cast<Categorie>();

        categoriesBox.close();
        return temp;
      }

      return null;
    } on Exception {
      throw Exception();
    }
  }
}
