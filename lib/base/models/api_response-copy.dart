// ignore_for_file: file_names

import 'package:beep_mobile/core/model.dart';

abstract class ApiResponsesBaseModel extends Model {
  ApiResponsesBaseModel.fromJson(Map<String, dynamic> json)
      : super.fromJson(json);
  ApiResponsesBaseModel();
}
