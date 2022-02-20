import 'package:curve_design/borders.dart';
import 'package:curve_design/colors.dart';
import 'package:curve_design/widgets/fill_align_blur_rotate_image.dart';
import 'package:flutter/material.dart';
class GirlBackground extends StatelessWidget {
  const GirlBackground({Key? key, this.child}) : super(key: key);
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: AppBorders.biggestCorner,
                gradient: LinearGradient(colors: [
                  AppColors.firstGradientColor,
                  AppColors.secondGradientColor,
                ])),
          ),
        ),
        const FillAlignBlurRotateImage(
          path: 'assets/diamond.png',
          alignment: Alignment(-.9, .3),
          height: 30.0,
          angle: .4,
        ),
        const FillAlignBlurRotateImage(
          path: 'assets/calendar.png',
          alignment: Alignment(.9, -.3),
          height: 40.0,
          angle: .4,
        ),
        Align(alignment: Alignment.center, child: child)
      ],
    );
  }
}