// ignore_for_file: file_names

import 'package:flutter/material.dart';

class AppVersion extends StatelessWidget {
  const AppVersion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(bottom: height * 0.005, top: height * 0.05),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset('assets/images/logo.png', height: height * 0.25),
          // Text(
          //   "CNAS.DZ",
          //   style: TextStyle(
          //       fontWeight: FontWeight.bold,
          //       color: Colors.blueAccent,
          //       fontSize: MediaQuery.of(context).size.height * 0.018),
          // ),
          // Text(
          //   "Version: 2.0.0\n",
          //   style:
          //       TextStyle(fontSize: MediaQuery.of(context).size.height * 0.015),
          // )
        ],
      ),
    );
  }
}
