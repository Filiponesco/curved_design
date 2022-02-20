import 'package:flutter/material.dart';
class GirlImage extends StatelessWidget {
  const GirlImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/girl.png',
      height: 300,
    );
  }
}