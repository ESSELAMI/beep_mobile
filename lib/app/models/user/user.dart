import 'dart:convert';

import 'package:beep_mobile/app/models/center/center.dart';
import 'package:beep_mobile/app/services/local/user.dart';
import 'package:beep_mobile/base/models/user.dart';
import 'package:beep_mobile/utils/generated/locales.g.dart';
import 'package:hive/hive.dart';
import 'package:get/get.dart';

part 'user.g.dart';

@HiveType(typeId: 9)
class User extends UserBaseModel with HiveObjectMixin {
  @HiveField(0)
  String? frFullName;
  @HiveField(1)
  String? arFullName;
  @HiveField(2)
  String? userPercentage;
  @HiveField(3)
  String? firstNameAr;
  @HiveField(4)
  String? status;
  @HiveField(5)
  String? statusAr;
  @HiveField(6)
  String? birthDate;
  @HiveField(7)
  String? statusDate;
  // @HiveField(8)
  // List<FamilyMember>? familyMembers;
  @HiveField(9)
  int? totalFamilyMembers;
  @HiveField(10)
  int? totalSickLeaves;
  @HiveField(11)
  int? totalPrescriptions;
  @HiveField(12)
  int? totalOnlineRequests;
  @HiveField(13)
  String? center;
  @HiveField(14)
  String? address;
  @HiveField(15)
  String? situationFam;
  @HiveField(16)
  String? noAssure;
  @HiveField(17)
  String? phone;
  @HiveField(18)
  String? email;
  @HiveField(19)
  String? hasQrCode;
  @HiveField(20)
  String? position;
  @HiveField(21)
  Centre? centre;
  @HiveField(22)
  String? lastNameAr;
  @HiveField(23)
  String? lastName;
  @HiveField(24)
  String? firstName;
  @HiveField(25)
  String? numserie;
  @HiveField(26)
  int? possedeDemandeCarteChifa;
  User();
  User.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    frFullName = json["assure"]["nom"] + " " + json["assure"]["prenom"] ?? "";
    firstName = json["assure"]["prenom"] ?? "";
    lastName = json["assure"]["nom"] ?? "";
    arFullName =
        json["assure"]["nomarabe"] + " " + json["assure"]["prenomarabe"] ?? "";
    firstNameAr = json["assure"]["prenomarabe"] ?? "";
    lastNameAr = json["assure"]["nomarabe"] ?? "";
    userPercentage = json["assure"]["taux"] ?? "";
    possedeDemandeCarteChifa = json["possedeDemandeCarteChifa"];
    numserie = json["assure"]["numserie"] ?? "";
    status = json["position"]["libelle"] ?? "";
    statusAr = json["position"]["libelleAr"] ?? "";
    birthDate = json["assure"]["dateNaissance"] ?? "";
    center = json["assure"]["centre"] ?? "";
    centre =
        json["hanaCentre"] != null ? Centre.fromJson(json["hanaCentre"]) : null;
    statusDate = json["assure"]["dateFinDroit"] ?? "";
    situationFam = json["assure"]["sitFamille"] ?? "";
    address = json["assure"]["adresse"] ?? "";
    noAssure = json["assure"]["noAssure"] ?? "";
    // familyMembers = (json['ayantDroits'] as List)
    //     .map((data) => FamilyMember.fromJson(data))
    //     .toList();
    totalFamilyMembers = json["ayantDroits"].length;
    // totalPrescriptions = json["dossiers"]["nombreDossierNatures"];
    // totalSickLeaves = json["dossiers"]["nombreDossierEspeces"];
    // totalOnlineRequests = json["dossiers"]["nombreDemandeEnLigne"];
    phone = json["assure"]["tel"] ?? "";
    email = json["assure"]["email"];
    hasQrCode = json["possedeQrCode"];
    position = json["position"]["positPK"]["statut"].toString() +
        json["position"]["positPK"]["posit"].toString();
  }

  List<User> getListFromJson(String jsonlist) {
    return (json.decode(jsonlist) as List)
        .map((data) => User.fromJson(data))
        .toList();
  }

  Future<void> localSave() async {
    UserLocalService().saveUser(this);
  }

  @override
  String toString() {
    String res = "centre : ${center.toString()} ";
    return res;
  }
}
