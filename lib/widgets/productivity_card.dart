import 'package:curve_design/borders.dart';
import 'package:curve_design/colors.dart';
import 'package:curve_design/dimens.dart';
import 'package:curve_design/widgets/girl_image.dart';
import 'package:curve_design/widgets/menu_icons.dart';
import 'package:curve_design/widgets/productivity_content.dart';
import 'package:flutter/material.dart';
class ProductivityCard extends StatelessWidget {
  const ProductivityCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          margin: const EdgeInsets.only(top: Dimens.topMarginFor3DImage),
          decoration: BoxDecoration(
            color: AppColors.lightGreyColor,
            borderRadius: AppBorders.bigCorner,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [ProductivityContent(), MenuIcons()],
          ),
        ),
        GirlImage(),
      ],
    );
  }
}