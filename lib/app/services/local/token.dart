import 'package:beep_mobile/app/models/token/token.dart';
import 'package:hive/hive.dart';

class TokenLocalService {
  // Future<void> saveUserToken(Token token) async {
  //   try {
  //     Token? temp = await getUserToken();
  //     if (temp == null) {
  //       const secureStorage = FlutterSecureStorage();
  //       //BOX_NAME is any string key for you box name.
  //       final secureKey = Hive.generateSecureKey();
  //       final encryptedBox = await Hive.openBox<Token>("tokens",
  //           encryptionCipher: HiveAesCipher(secureKey));
  //       await encryptedBox.put('token', token);

  //       //SECURE_STORAGE_KEY is any string key.
  //       await secureStorage.write(
  //         key: "SECURE_STORAGE_KEY",
  //         value: json.encode(secureKey),
  //       );
  //     } else {
  //       temp.accessToken = token.accessToken;
  //       temp.expiryDate = token.expiryDate;
  //       if (token.refreshToken != null) {
  //         temp.refreshToken = token.refreshToken;
  //       }

  //       temp.save();
  //     }
  //   } on Exception catch (e) {
  //     throw Exception(e.toString());
  //   }
  // }

// ! get token with secure storage
  // Future<Token?> getUserToken() async {
  //   try {
  //     const secureStorage = FlutterSecureStorage();
  //     final secureKey = await secureStorage.read(key: "SECURE_STORAGE_KEY");
  //     if (secureKey != null) {
  //       if (!Hive.isBoxOpen("tokens")) {
  //         final userBox = await Hive.openBox<Token>("tokens",
  //             encryptionCipher: HiveAesCipher(
  //                 json.decode(secureKey.toString())!.cast<int>()));
  //         if (userBox.isNotEmpty) {

  //           Token temp = userBox.get('token')!;
  //           // await userBox.close();
  //           return temp;
  //         }
  //       } else {
  //       }
  //     }
  //     return null;
  //   } on Exception {
  //     throw Exception();
  //   }
  // }

// pas encore testé
  // clearUserToken() async {
  //   try {
  //     const secureStorage = FlutterSecureStorage();
  //     final secureKey = await secureStorage.read(key: "SECURE_STORAGE_KEY");
  //     if (secureKey != null) {
  //       final userBox = await Hive.openBox<Token>("tokens",
  //           encryptionCipher:
  //               HiveAesCipher(json.decode(secureKey.toString())!.cast<int>()));

  //       userBox.delete('token');

  //       // await userBox.close();

  //     }
  //   } on Exception {
  //     throw Exception();
  //   }
  // }

  clearUserToken() async {
    try {
      final userBox = await Hive.openBox<Token>("tokens");

      userBox.clear();

      // await userBox.close();

    } on Exception {
      throw Exception();
    }
  }

// ! get token with secure storage
  Future<Token?> getUserToken() async {
    try {
      final userBox = await Hive.openBox<Token>("tokens");
      if (userBox.isNotEmpty) {
        Token temp = userBox.get('token')!;
        // await userBox.close();
        return temp;
      }

      return null;
    } on Exception {
      throw Exception();
    }
  }

// pas encore testé
  Future<void> saveUserToken(Token token) async {
    try {
      Token? temp = await getUserToken();
      if (temp == null) {
        // const secureStorage = FlutterSecureStorage();
        //BOX_NAME is any string key for you box name.
        // final secureKey = Hive.generateSecureKey();
        final encryptedBox = await Hive.openBox<Token>("tokens");
        await encryptedBox.put('token', token);
      } else {
        temp.accessToken = token.accessToken;
        temp.expiryDate = token.expiryDate;
        if (token.refreshToken != null) {
          temp.refreshToken = token.refreshToken;
        }

        temp.save();
      }
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }
}
