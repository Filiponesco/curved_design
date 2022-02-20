import 'package:curve_design/widgets/image_blur.dart';
import 'package:flutter/material.dart';
class FillAlignBlurRotateImage extends StatelessWidget {
  const FillAlignBlurRotateImage({
    Key? key,
    required this.path,
    required this.alignment,
    this.angle = 0,
    required this.height,
  }) : super(key: key);
  final String path;
  final Alignment alignment;
  final double angle;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
        child: Align(
          alignment: alignment,
          child: ImageBlur(
            child: Transform.rotate(
                angle: angle,
                child: Image.asset(
                  path,
                  height: height,
                )),
          ),
        ));
  }
}
