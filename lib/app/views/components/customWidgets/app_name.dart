import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppName extends StatefulWidget {
  const AppName({Key? key}) : super(key: key);

  @override
  _AppNameState createState() => _AppNameState();
}

class _AppNameState extends State<AppName> {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final PackageInfo info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.only(bottom: height * 0.005, top: height * 0.05),
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            "CNAS.DZ",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
                fontSize: MediaQuery.of(context).size.width * 0.036),
          ),
          Text(
            _packageInfo.version + _packageInfo.buildNumber,
            style:
                TextStyle(fontSize: MediaQuery.of(context).size.width * 0.036),
          )
        ],
      ),
    );
  }
}
