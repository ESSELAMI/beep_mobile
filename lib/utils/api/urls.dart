class SecurityApi {
  static String baseUrl = 'https://auth.beep_mobile.ml/api/';
  // 'http://10.236.1.242:8201/api/v1/';n
  static String loginUrl = '${baseUrl}login';
  static String registerUrl = '${baseUrl}registre';
  static String searchUser = '${baseUrl}ass';
  static String refreshToken = '${baseUrl}refreshTokens';
  static String sendSmsCode = '${baseUrl}sendSMS';
  static String updatePassword = '${baseUrl}hanaUsers/password/updatePassword';
  static String sendSMSConfirmation =
      '${baseUrl}hanaUsers/phone/sendSMSConfirmation';
  static String forgotPassword = '${baseUrl}hanaUsers/phone/number';
  static String updatePhone =
      '${baseUrl}hanaUsers/phone/update/confirmSMSPhone';
  static String confirmPhone = '${baseUrl}hanaUsers/password/sendPasswordSMS';
  static String updateProfile = '${baseUrl}profil/update';
}

class DataApi {
  static String baseUrl =
      'https://elhanaa.cnas.dz:447/proxy-service/elhanaa-service/api/v1/';
  // 'http://10.125.1.152:8055/api/v1/';
  static String qrCode = '${baseUrl}QRCode/assure?codeOfficine=5';
  static String userData = '${baseUrl}assure';
  static String dossiersEspece = '${baseUrl}dossiersEspece';
  static String ordonnances = '${baseUrl}ordonnances';
  static String ordonnancesByDateDebut = '${baseUrl}ordonnances/dateDebut/';
  static String prescripteursByWilaya = '${baseUrl}prescripteurs/agences/';
  static String speciality = '${baseUrl}specialites/all';
  static String specialityDoctors = '${baseUrl}HanaSpecialiteMedecins/all';
  static String officine = '${baseUrl}officines/centreStartWith/1';
  static String center = '${baseUrl}centres/all';
  static String lieuExercice = '${baseUrl}Lieuexercice/all';
  static String structureSantes = '${baseUrl}structureSantes/agence/';
  static String requestSickLeave = '${baseUrl}assure/demandeArretTravail';
  static String sickLeaveRequests = '${baseUrl}assure/demandeArretTravail/all';
  static String commune = '${baseUrl}communes/all';
  static String addPreoccupation = '${baseUrl}accesRequest/add';
  static String getSickLeaveReciept = '${baseUrl}demandeArretTravail/pdf/';
  static String getAffiliationDocument = '${baseUrl}attestationAffiliation/pdf';
  static String requestChifaCard = '${baseUrl}assure/demandeCarte';
  static String preoccupations = '${baseUrl}questions/all';
  static String categorie = '${baseUrl}accesRequest/risque';
  static String person = '${baseUrl}accesRequest/risque';
  static String demande = '${baseUrl}accesRequest/risque';
  static String materiel = '${baseUrl}accesRequest/risque';
  static String userPreoccupations = '${baseUrl}accesRequest/risque';
}
