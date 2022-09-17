import 'dart:convert';

import 'package:beep_mobile/app/models/product/product.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';

class ProductLocalService {
  clearProduct() async {
    try {
      final productBox = await Hive.openBox<Product>("products");
      productBox.clear();
    } on Exception {
      throw Exception();
    }
  }

  Future<bool> saveProduct(Product product) async {
    try {
      final productsBox = await Hive.openBox<Product>("products");
      print("-------------");
      var p = productsBox.values
          .where((element) => product.codeBarre == element.codeBarre);
      if (p.isEmpty) {
        await productsBox.add(product);
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<bool> saveProducts(List<Product> products) async {
    try {
      final productsBox = await Hive.openBox<Product>("products");
      print("-------------");

      await productsBox.addAll(products);
      return true;
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<bool> saveProductsSecure(List<Product> products) async {
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
      print('Encryption key: $encryptionKey1');
      final productsBox = await Hive.openBox<Product>("products",
          encryptionCipher: HiveAesCipher(encryptionKey1));
      print("-------------");

      await productsBox.addAll(products);
      productsBox.close();
      return true;
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<Product>?> getProducts() async {
    try {
      const secureStorage = FlutterSecureStorage();
      final key = await secureStorage.read(key: 'key');
      final encryptionKey = base64Url.decode(key!);
      final productsBox = await Hive.openBox<Product>("products",
          encryptionCipher: HiveAesCipher(encryptionKey));
      // final productsBox = await Hive.openBox<Product>("products");
      if (productsBox.isNotEmpty) {
        List<Product> temp = productsBox.values.toList().cast<Product>();
        print(temp.toString());
        return temp;
      }

      return null;
    } on Exception {
      throw Exception();
    }
  }
}
