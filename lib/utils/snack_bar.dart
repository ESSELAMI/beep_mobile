import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'generated/locales.g.dart';

class SnackBarWidget {
  String body = "";
  showErrorSnackBar(String message) {
    if (message.toLowerCase().contains("bad credentials")) {
      body = LocaleKeys.error_bad_credentials.tr;
    } else if (message.toLowerCase().contains("timeoutexception")) {
      body = LocaleKeys.error_connection.tr;
    } else if (message
        .toLowerCase()
        .contains("vous avez dépassé le nombre de tentatives")) {
      body = LocaleKeys.error_attempts_number.tr;
    } else if (message.toLowerCase().contains("ass not found")) {
      body = LocaleKeys.error_user_not_found.tr;
    } else if (message.toLowerCase().contains("conflict")) {
      body = LocaleKeys.error_account_exists.tr;
    } else if (message.toLowerCase().contains("passwords do not match")) {
      body = LocaleKeys.error_passwords_not_match.tr;
    } else if (message.toLowerCase().contains("incorrect ss number")) {
      body = LocaleKeys.error_incorrect_ss_number.tr;
    } else if (message.toLowerCase().contains("empty fields")) {
      body = LocaleKeys.error_empty_fields.tr;
    } else if (message.toLowerCase().contains("hana user is not registred")) {
      body = LocaleKeys.error_user_not_found.tr;
    } else if (message.toLowerCase().contains("error phone number")) {
      body = LocaleKeys.error_wrong_phone_number.tr;
    } else if (message.toLowerCase().contains("short password")) {
      body = LocaleKeys.error_short_password.tr;
    } else if (message.toLowerCase().contains("code specialite not found")) {
      body = LocaleKeys.error_contact_cnas.tr;
    } else if (message.toLowerCase().contains("erreur code sms")) {
      body = LocaleKeys.error_code_sms.tr;
    } else if (message.toLowerCase().contains("chevauchement de periode")) {
      body = LocaleKeys.error_date_exist.tr;
    } else if (message.toLowerCase().contains("periode depasse les 90 jours")) {
      body = LocaleKeys.error_date_exist.tr;
    } else if (message
        .toLowerCase()
        .contains("erreur Date debut arret travail")) {
      body = LocaleKeys.error_date_exist.tr;
    } else if (message.toLowerCase().contains("assures n'ouvre pas droit")) {
      body = LocaleKeys.error_contact_cnas.tr;
    } else if (message
        .toLowerCase()
        .contains("erreur lors de la sauvegarde dans la bd")) {
      body = LocaleKeys.error_connection.tr;
    } else if (message.toLowerCase().contains("wrong username")) {
      body = LocaleKeys.error_wrong_username.tr;
    } else if (message
        .toLowerCase()
        .contains("Veuillez deposer l'ATS".toLowerCase())) {
      body = LocaleKeys.error_rights_end_expired_workers.tr;
    } else if (message
        .toLowerCase()
        .contains("veuillez deposer votre cerificat de scolarite")) {
      body = LocaleKeys.error_rights_end_expired_students.tr;
    } else if (message.toLowerCase().contains(
        "Le nom et le prenom en arabe sont obligatoires, veuillez les renseigner."
            .toLowerCase())) {
      body = LocaleKeys.error_arabic_names.tr;
    } else if (message
        .toLowerCase()
        .contains("Erreur groupe sanguin".toLowerCase())) {
      body = LocaleKeys.error_empty_fields.tr;
    } else if (message.toLowerCase().contains(
        "Assure possede deja une carte chifa avec le numero de serie"
            .toLowerCase())) {
      body = LocaleKeys.error_chifa_card_exists.tr;
    } else if (message.toLowerCase().contains(
        "Une demande existe deja au niveau de votre centre CNAS."
            .toLowerCase())) {
      body = LocaleKeys.error_chifa_card_request.tr;
    } else if (message.toLowerCase().contains(
        "Vous avez deja effectue une demande via le portail ELHANAA."
            .toLowerCase())) {
      body = LocaleKeys.error_chifa_card_request.tr;
    } else if (message.toLowerCase().contains(
        "Date fin de droit expiree, veuillez deposer l attestation de travail"
            .toLowerCase())) {
      body = LocaleKeys.error_rights_end_expired_workers.tr;
    } else if (message
        .toLowerCase()
        .contains("Assure decede, demande non autorisee.".toLowerCase())) {
      body = LocaleKeys.error_dead_user.tr;
    } else if (message.toLowerCase().contains(
        "Votre statut ne vous permet pas de creer une demande."
            .toLowerCase())) {
      body = LocaleKeys.error_chifa_status.tr;
    } else if (message
        .toLowerCase()
        .contains("Statut invalide, demande non autorisee.".toLowerCase())) {
      body = LocaleKeys.error_bad_status.tr;
    } else if (message.toLowerCase().contains(
        "Centre d affiliation invalide, demande non autorisee."
            .toLowerCase())) {
      body = LocaleKeys.error_centre_chifa.tr;
    } else if (message
        .toLowerCase()
        .contains("Informations manquantes".toLowerCase())) {
      body = LocaleKeys.error_not_enough_info.tr;
    } else if (message
        .toLowerCase()
        .contains("Informations employeur manquantes".toLowerCase())) {
      body = LocaleKeys.error_employer_info.tr;
    } else if (message
        .toLowerCase()
        .contains("Centre invalide".toLowerCase())) {
      body = LocaleKeys.error_center.tr;
    } else if (message
        .toLowerCase()
        .contains("vous avez le droit d'envoyer".toLowerCase())) {
      body = LocaleKeys.error_single_message_per_day.tr;
    }

    Get.snackbar(
      LocaleKeys.error_title.tr.capitalizeFirst!,
      body,
      messageText: Text(
        body,
        textAlign: TextAlign.start,
      ),
      animationDuration: const Duration(milliseconds: 900),
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      backgroundColor: Colors.redAccent,
      icon: const Icon(Icons.error, color: Colors.white),
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
