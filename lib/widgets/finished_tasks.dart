import 'package:curve_design/borders.dart';
import 'package:curve_design/colors.dart';
import 'package:flutter/material.dart';

class FinishedTasks extends StatelessWidget {
  const FinishedTasks({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: AppBorders.bigCorner, color: AppColors.lightGreyColor.withOpacity(.5)),
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.whiteColor),
            padding: const EdgeInsets.all(4.0),
            child: Image.asset(
              'assets/flame.png',
              height: 12,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              'finished 3 tasks',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: AppColors.greyColor, fontWeight: FontWeight.bold, fontFamily: ''),
            ),
          )
        ],
      ),
    );
  }
}
