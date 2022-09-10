import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Screen<Controller> extends GetResponsiveView<Controller> {
  Screen({Key? key}) : super(key: key);
}
