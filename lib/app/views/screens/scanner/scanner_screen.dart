import 'package:beep_mobile/app/views/screens/scanner/scanner_widget.dart';
import 'package:beep_mobile/base/controllers/home.dart';
import 'package:beep_mobile/core/screen.dart';
import 'package:flutter/material.dart';

class ScannerScreen extends Screen<BaseHomeController> {
  ScannerScreen({Key? key}) : super(key: key);

  @override
  Widget? desktop() {
    return Row(
      children: [
        Expanded(
          child: Card(
            child: ScannerWidget(),
          ),
        )
      ],
    );
  }

  @override
  Widget? tablet() {
    return super.tablet();
  }

  @override
  Widget? phone() {
    return ScannerWidget();
  }
}
