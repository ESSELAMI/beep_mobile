import 'dart:convert';

import 'package:beep_mobile/base/models/type.dart';
import 'package:get/get.dart';

class Type extends TypeBaseModel {
  Type();
  Type.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    // code = json["centre"].toString();
  }

  List<Type> getListFromJson(String jsonlist) {
    return (json.decode(jsonlist) as List)
        .map((data) => Type.fromJson(data))
        .toList();
  }

  Future<void> setType(Type type) async {}
}
