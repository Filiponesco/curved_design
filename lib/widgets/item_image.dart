import 'package:curve_design/borders.dart';
import 'package:flutter/material.dart';

class ItemImage extends StatelessWidget {
  const ItemImage({
    Key? key,
    required this.path,
    required this.backgroundColor,
    required this.padding,
    required this.imageHeight,
  }) : super(key: key);
  final String path;
  final Color backgroundColor;
  final EdgeInsets padding;
  final double imageHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: AppBorders.smallCorner,
        color: backgroundColor,
      ),
      padding: padding,
      child: Image.asset(
        path,
        height: imageHeight,
      ),
    );
  }
}