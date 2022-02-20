import 'dart:ui';

import 'package:curve_design/borders.dart';
import 'package:curve_design/colors.dart';
import 'package:curve_design/paddings.dart';
import 'package:curve_design/widgets/productivity_card.dart';
import 'package:curve_design/widgets/progress_bar.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: Paddings.mainPadding,
          child: SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 60.0),
                        child: ProductivityCard(),
                      ),
                      Positioned(
                        left: 0.0,
                        right: 0.0,
                        top: 50,
                        child: Align(
                          alignment: Alignment(-.6, 0),
                          child: Transform.rotate(
                              angle: -.7,
                              child: Image.asset(
                                'assets/chat.png',
                                height: 44.0,
                              )),
                        ),
                      ),
                      Positioned(
                        top: 10.0,
                        left: 0.0,
                        right: 0.0,
                        child: Align(
                          alignment: Alignment(-.1, 0),
                          child: Image.asset(
                            'assets/thunderbolt.png',
                            height: 34.0,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 40.0,
                        right: 0.0,
                        left: 0.0,
                        child: Align(
                          alignment: Alignment(.6, 0),
                          child: Container(
                            height: 40.0,
                            width: 40.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: Image.asset(
                                'assets/basketball-ball.png',
                              ).image),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SliverToBoxAdapter(child: const ListHeader()),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return items[index];
                    },
                    childCount: 2,
                  ),
                ),
                SliverPadding(padding: EdgeInsets.only(top: 20.0))
              ],
            ),
          )),
    );
  }
}

const List<Widget> items = [
  SingleItem(
    imagePath: 'assets/calendar.png',
    backgroundColor: AppColors.lightPinkColor,
    title: '3D icons project',
    progress: .8,
    estimatedTimeInDays: 5,
  ),
  SingleItem(
    imagePath: 'assets/dash.png',
    backgroundColor: AppColors.lightBlueColor,
    title: 'UI design for Opaper',
    progress: .4,
    estimatedTimeInDays: 10,
    imagePadding: const EdgeInsets.all(4.0),
    imageHeight: 50.0,
  ),
];

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
      child: Container(
        decoration: ShapeDecoration(
          shape: Theme.of(context).listTileTheme.shape ?? const RoundedRectangleBorder(),
          color: Theme.of(context).listTileTheme.tileColor,
        ),
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
    );
  }
}

class HeartIcon extends StatelessWidget {
  const HeartIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.whiteColor, boxShadow: [
        BoxShadow(
          offset: Offset(0, 4),
          blurRadius: 6,
          spreadRadius: 0.0,
          color: AppColors.greyColor.withOpacity(.5),
        ),
      ]),
      padding: EdgeInsets.all(4.0),
      child: Image.asset(
        'assets/heart.png',
        height: 16.0,
      ),
    );
  }
}

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

class ListHeader extends StatelessWidget {
  const ListHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'All tasks',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                        color: AppColors.violetColor,
                      ),
                ),
                TextSpan(
                  text: '.',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w900,
                        color: AppColors.primaryColor,
                      ),
                ),
              ],
            ),
          ),
          Spacer(),
          ViewAllText()
        ],
      ),
    );
  }
}

class ViewAllText extends StatelessWidget {
  const ViewAllText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 4.0),
          child: Text(
            'View all',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.primaryColor),
          ),
        ),
        Icon(
          Icons.arrow_forward_ios,
          color: AppColors.primaryColor,
          size: 14,
        )
      ],
    ));
  }
}
