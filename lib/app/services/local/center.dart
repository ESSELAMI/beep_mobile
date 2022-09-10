import 'package:beep_mobile/app/models/center/center.dart';

import 'package:hive/hive.dart';

class CentreLocalService {
  clearCentre() async {
    try {
      // const secureStorage = FlutterSecureStorage();
      // final secureKey = await secureStorage.read(key: "SECURE_STORAGE_KEY");
      // if (secureKey != null) {
      //   final centreBox = await Hive.openBox<Centre>("centres",
      //       encryptionCipher:
      //           HiveAesCipher(json.decode(secureKey.toString())!.cast<int>()));
      final centreBox = await Hive.openBox<Centre>("centres");
      centreBox.clear();

      // await centreBox.close();

      // }
    } on Exception {
      throw Exception();
    }
  }

  Future<Centre?> getCentre() async {
    try {
      // const secureStorage = FlutterSecureStorage();
      // final secureKey = await secureStorage.read(key: "SECURE_STORAGE_KEY");
      // if (secureKey != null) {
      //   final centreBox = await Hive.openBox<Centre>("centres",
      //       encryptionCipher:
      //           HiveAesCipher(json.decode(secureKey.toString())!.cast<int>()));
      final centreBox = await Hive.openBox<Centre>("centres");
      if (centreBox.isNotEmpty) {
        Centre temp = centreBox.get('centre')!;
        return temp;
      }

      // await centreBox.close();

      // }
      return null;
    } on Exception {
      throw Exception();
    }
  }

  Future<List<Centre>?> getCentres() async {
    try {
      // const secureStorage = FlutterSecureStorage();
      // final secureKey = await secureStorage.read(key: "SECURE_STORAGE_KEY");
      // if (secureKey != null) {
      //   final centreBox = await Hive.openBox<Centre>("centres",
      //       encryptionCipher:
      //           HiveAesCipher(json.decode(secureKey.toString())!.cast<int>()));
      final centreBox = await Hive.openBox<Centre>("centres");
      if (centreBox.isNotEmpty) {
        List<Centre> temp = centreBox.values.toList();

        return temp;
      }

      // await centreBox.close();

      // }
      return null;
    } on Exception {
      throw Exception();
    }
  }

  Future<void> saveCentre(Centre centre) async {
    try {
      Centre? temp = await getCentre();
      if (temp == null) {
        // const secureStorage = FlutterSecureStorage();
        //BOX_NAME is any string key for you box name.
        // final secureKey = Hive.generateSecureKey();
        // final encryptedBox = await Hive.openBox<Centre>("centres",
        //     encryptionCipher: HiveAesCipher(secureKey));
        final encryptedBox = await Hive.openBox<Centre>("centres");
        await encryptedBox.put('centre', centre);

        //SECURE_STORAGE_KEY is any string key.
        // await secureStorage.write(
        //   key: "SECURE_STORAGE_KEY",
        //   value: json.encode(secureKey),
        // );
      } else {
        temp.setCentre(centre);
        temp.save();
      }
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

// pas encore testé
  Future<void> saveCentres(List<Centre> centres) async {
    try {
      List<Centre>? temp = await getCentres();
      if (temp == null) {
        // const secureStorage = FlutterSecureStorage();
        //BOX_NAME is any string key for you box name.
        // final secureKey = Hive.generateSecureKey();
        // final encryptedBox = await Hive.openBox<Centre>("centres",
        //     encryptionCipher: HiveAesCipher(secureKey));
        final encryptedBox = await Hive.openBox<Centre>("centres");

        for (var centre in centres) {
          await encryptedBox.add(centre);
        }

        //SECURE_STORAGE_KEY is any string key.
        // await secureStorage.write(
        //   key: "SECURE_STORAGE_KEY",
        //   value: json.encode(secureKey),
        // );
      } else {
        clearCentre();
        final encryptedBox = await Hive.openBox<Centre>("centres");

        for (var centre in centres) {
          await encryptedBox.add(centre);
        }
      }
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }
}
