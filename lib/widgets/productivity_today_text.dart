import 'package:curve_design/colors.dart';
import 'package:flutter/material.dart';

class ProductivityTodayText extends StatelessWidget {
  const ProductivityTodayText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Productivity: ',
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(fontWeight: FontWeight.w900, color: AppColors.violetColor),
          ),
          TextSpan(
            text: 'Today',
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.copyWith(fontWeight: FontWeight.w900, color: AppColors.primaryColor),
          ),
        ],
      ),
    );
  }
}
