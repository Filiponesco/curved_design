
import 'package:flutter/material.dart';

class ClipConcaveBottom extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    const startNotchOffset = 60.0;
    final radius = size.width * 1.8;
    Path path = Path()
      ..lineTo(size.width, 0) // nothing
      ..lineTo(size.width, size.height)
      ..lineTo(size.width - startNotchOffset, size.height)
      ..arcToPoint(Offset(startNotchOffset, size.height), radius: Radius.circular(radius), clockwise: false)
      ..lineTo(0, size.height)
      ..lineTo(0, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<dynamic> oldClipper) => false;
}