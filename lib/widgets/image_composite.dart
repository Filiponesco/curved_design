import 'package:curve_design/dimens.dart';
import 'package:curve_design/widgets/girl_background.dart';
import 'package:flutter/material.dart';
class ImageComposite extends StatelessWidget {
  const ImageComposite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(height: Dimens.compositeImageHeight, child: const GirlBackground());
  }
}