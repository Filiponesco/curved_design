import 'package:curve_design/borders.dart';
import 'package:curve_design/colors.dart';
import 'package:curve_design/widgets/heart_icon.dart';
import 'package:curve_design/widgets/item_image.dart';
import 'package:curve_design/widgets/progress_bar.dart';
import 'package:flutter/material.dart';

class SingleItem extends StatelessWidget {
  const SingleItem({
    Key? key,
    required this.imagePath,
    required this.backgroundColor,
    required this.title,
    required this.estimatedTimeInDays,
    required this.progress,
    this.imagePadding = const EdgeInsets.all(14.0),
    this.imageHeight = 30,
  }) : super(key: key);
  final String imagePath;
  final Color backgroundColor;
  final String title;
  final int estimatedTimeInDays;
  final double progress;
  final EdgeInsets imagePadding;
  final double imageHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Material(
        color: Theme.of(context).listTileTheme.tileColor,
        shape: const RoundedRectangleBorder(borderRadius: AppBorders.mediumCorner),
        child: InkWell(
          customBorder: const RoundedRectangleBorder(borderRadius: AppBorders.mediumCorner),
          onTap: (){},
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
            child: Stack(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 14.0),
                        child: ItemImage(
                          path: imagePath,
                          backgroundColor: backgroundColor,
                          padding: imagePadding,
                          imageHeight: imageHeight,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title),
                          ProgressBar(
                            progress: progress,
                            height: 16.0,
                            color: AppColors.secondGradientColor,
                          ),
                          FittedBox(
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(text: 'Estimated finished in ', style: Theme.of(context).textTheme.bodySmall),
                                  TextSpan(
                                      text: '$estimatedTimeInDays days',
                                      style:
                                      Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.primaryColor)),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Spacer()
                  ],
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: HeartIcon(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}