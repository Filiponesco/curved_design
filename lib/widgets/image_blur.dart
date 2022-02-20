import 'dart:ui';
import 'package:flutter/material.dart';
class ImageBlur extends StatelessWidget {
  const ImageBlur({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ImageFiltered(
        imageFilter: ImageFilter.blur(
          sigmaX: 2.0,
          sigmaY: 2.0,
        ),
        child: child);
  }
}