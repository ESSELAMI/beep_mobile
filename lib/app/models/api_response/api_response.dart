import 'dart:convert';

import 'package:beep_mobile/base/models/api_response.dart';

class ApiResponse extends ApiResponseBaseModel {
  String? statusCode;
  String? body;
  String? error;

  ApiResponse.fromJson(response) : super.fromJson(response) {
    statusCode = response.statusCode.toString();
    body = response.body.toString();
    error = response.statusCode.toString() != "200"
        ? json.decode(response.body)["error"].toString()
        : "";
  }
}
