import 'dart:convert';

import 'package:beep_mobile/base/models/document.dart';
import 'package:get/get.dart';

class Document extends DocumentBaseModel {
  Document();
  Document.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    // code = json["centre"].toString();
  }

  List<Document> getListFromJson(String jsonlist) {
    return (json.decode(jsonlist) as List)
        .map((data) => Document.fromJson(data))
        .toList();
  }

  Future<void> setDocument(Document document) async {}
}
