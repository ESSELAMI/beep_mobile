import 'dart:convert';

import 'package:beep_mobile/app/models/unite/unite.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';

class UniteLocalService {
  clearUnite() async {
    try {
      final uniteBox = await Hive.openBox<Unite>("unites");
      uniteBox.clear();
    } on Exception {
      throw Exception();
    }
  }

  Future<bool> saveUnite(Unite unite) async {
    try {
      final unitesBox = await Hive.openBox<Unite>("unites");

      var p = unitesBox.values
          .where((element) => unite.nomFr == element.nomFr);
      if (p.isEmpty) {
        await unitesBox.add(unite);
        return true;
      } else {
        return false;
      }
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<bool> saveUnites(List<Unite> unites) async {
    try {
      final unitesBox = await Hive.openBox<Unite>("unites");

      await unitesBox.addAll(unites);
      return true;
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<bool> saveUnitesSecure(List<Unite> unites) async {
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

      final unitesBox = await Hive.openBox<Unite>("unites",
          encryptionCipher: HiveAesCipher(encryptionKey1));

      await unitesBox.addAll(unites);
      unitesBox.close();
      return true;
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<Unite>?> getUnites() async {
    try {
      const secureStorage = FlutterSecureStorage();
      final key = await secureStorage.read(key: 'key');
      final encryptionKey = base64Url.decode(key!);

      final unitesBox = await Hive.openBox<Unite>("unites",
          encryptionCipher: HiveAesCipher(encryptionKey));

      if (unitesBox.isNotEmpty) {
        List<Unite> temp = unitesBox.values.toList().cast<Unite>();

        unitesBox.close();
        return temp;
      }

      return null;
    } on Exception {
      throw Exception();
    }
  }
}
