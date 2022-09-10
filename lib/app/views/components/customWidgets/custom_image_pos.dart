import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final double? opacity;
  final double? height;
  final String? networkImgURL;

  const CustomImage({Key? key, this.networkImgURL, this.height, this.opacity})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity!,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Align(
          alignment: Alignment.topRight,
          child: Image.network(
            networkImgURL!,
            height: height,
          ),
        ),
      ),
    );
  }
}
