import 'package:beep_mobile/app/models/user/user.dart';
import 'package:hive/hive.dart';

class UserLocalService {
  clearUser() async {
    try {
      // const secureStorage = FlutterSecureStorage();
      // final secureKey = await secureStorage.read(key: "SECURE_STORAGE_KEY");
      // if (secureKey != null) {
      //   final userBox = await Hive.openBox<User>("users",
      //       encryptionCipher:
      //           HiveAesCipher(json.decode(secureKey.toString())!.cast<int>()));
      final userBox = await Hive.openBox<User>("users");
      userBox.clear();

      // await userBox.close();

      // }
    } on Exception {
      throw Exception();
    }
  }

  Future<User?> getUser() async {
    try {
      // const secureStorage = FlutterSecureStorage();
      // final secureKey = await secureStorage.read(key: "SECURE_STORAGE_KEY");
      // if (secureKey != null) {
      //   final userBox = await Hive.openBox<User>("users",
      //       encryptionCipher:
      //           HiveAesCipher(json.decode(secureKey.toString())!.cast<int>()));
      final userBox = await Hive.openBox<User>("users");
      if (userBox.isNotEmpty) {
        User temp = userBox.get('user')!;
        return temp;
      }

      // await userBox.close();

      // }
      return null;
    } on Exception {
      throw Exception();
    }
  }

// pas encore testé
  Future<void> saveUser(User user) async {
    try {
      User? temp = await getUser();
      if (temp == null) {
        // const secureStorage = FlutterSecureStorage();
        //BOX_NAME is any string key for you box name.
        // final secureKey = Hive.generateSecureKey();
        // final encryptedBox = await Hive.openBox<User>("users",
        //     encryptionCipher: HiveAesCipher(secureKey));
        final encryptedBox = await Hive.openBox<User>("users");
        await encryptedBox.put('user', user);

        //SECURE_STORAGE_KEY is any string key.
        // await secureStorage.write(
        //   key: "SECURE_STORAGE_KEY",
        //   value: json.encode(secureKey),
        // );
      } else {
        temp.arFullName = user.arFullName;
        temp.birthDate = user.birthDate;
        // temp.familyMembers = user.familyMembers;
        temp.frFullName = user.frFullName;
        temp.firstNameAr = user.firstNameAr;
        temp.lastNameAr = user.lastNameAr;
        temp.status = user.status;
        temp.statusAr = user.statusAr;
        temp.statusDate = user.statusDate;
        temp.totalFamilyMembers = user.totalFamilyMembers;
        temp.totalOnlineRequests = user.totalOnlineRequests;
        temp.totalPrescriptions = user.totalOnlineRequests;
        temp.totalSickLeaves = user.totalSickLeaves;
        temp.possedeDemandeCarteChifa = user.possedeDemandeCarteChifa;
        temp.numserie = user.numserie;

        temp.save();
      }
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> updateUserPhone(String phone) async {
    try {
      User? temp = await getUser();
      if (temp == null) {
      } else {
        temp.phone = phone;
        temp.save();
      }
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> updateUserHasChifaCard() async {
    try {
      User? temp = await getUser();
      if (temp == null) {
      } else {
        temp.possedeDemandeCarteChifa = 1;
        temp.save();
      }
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> updateUserInfo(
      String email, String firstNameAr, String lastNameAr) async {
    try {
      User? temp = await getUser();
      if (temp == null) {
      } else {
        temp.email = email;
        temp.firstNameAr = firstNameAr;
        temp.lastNameAr = lastNameAr;

        temp.save();
      }
    } on Exception catch (e) {
      throw Exception(e.toString());
    }
  }
}
