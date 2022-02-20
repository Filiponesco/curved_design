import 'package:curve_design/borders.dart';
import 'package:curve_design/colors.dart';
import 'package:curve_design/widgets/clip_concave_bottom.dart';
import 'package:curve_design/widgets/finished_tasks.dart';
import 'package:curve_design/widgets/image_composite.dart';
import 'package:curve_design/widgets/productivity_today_text.dart';
import 'package:curve_design/widgets/progress_bar.dart';
import 'package:flutter/material.dart';
class ProductivityContent extends StatelessWidget {
  const ProductivityContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ClipConcaveBottom(),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: AppBorders.bigCorner,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: const [
              ImageComposite(),
              Padding(
                padding: EdgeInsets.only(top: 18.0, bottom: 12),
                child: ProductivityTodayText(),
              ),
              Center(
                child: FinishedTasks(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                child: CurvedProgressBar(
                  progress: .7,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}