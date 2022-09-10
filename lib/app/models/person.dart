import 'dart:convert';

import 'package:beep_mobile/base/models/person.dart';
import 'package:get/get.dart';

class Person extends PersonBaseModel {
  Person();
  Person.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    // code = json["centre"].toString();
  }

  List<Person> getListFromJson(String jsonlist) {
    return (json.decode(jsonlist) as List)
        .map((data) => Person.fromJson(data))
        .toList();
  }

  Future<void> setPerson(Person person) async {}
}
