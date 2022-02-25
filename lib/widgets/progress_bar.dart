import 'dart:math';

import 'package:curve_design/borders.dart';
import 'package:curve_design/colors.dart';
import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({Key? key, required this.progress, this.height = 30.0, this.color = AppColors.primaryColor})
      : super(key: key);
  final double progress;
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: color.withOpacity(.3),
        borderRadius: AppBorders.bigCorner,
      ),
      child: TweenAnimationBuilder<double>(
        builder: (context, value, child) {
          return FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: value,
            child: Container(
              height: height,
              decoration: BoxDecoration(
                color: color,
                borderRadius: AppBorders.bigCorner,
              ),
              child: Center(
                child: FittedBox(
                  child: Text(
                    '${(value * 100).ceil()}%',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: AppColors.whiteColor, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          );
        },
        duration: Duration(seconds: 3),
        tween: Tween(begin: 0.0, end: progress),
        curve: Curves.easeOutExpo,
      ),
    );
  }
}

class CurvedProgressBar extends StatefulWidget {
  const CurvedProgressBar({Key? key, required this.progress, this.height = 28.0, this.color = AppColors.primaryColor})
      : super(key: key);
  final double progress;
  final double height;
  final Color color;

  @override
  State<CurvedProgressBar> createState() => _CurvedProgressBarState();
}

class _CurvedProgressBarState extends State<CurvedProgressBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: TweenAnimationBuilder<double>(
        curve: Curves.easeOutExpo,
        tween: Tween<double>(begin: 0.0, end: widget.progress),
        builder: (context, value, child) {
          return Stack(
            children: [
              Positioned.fill(
                child: CustomPaint(
                  foregroundPainter: BendedPainter(
                      color: AppColors.primaryColor,
                      progress: value,
                      curvature: MediaQuery.of(context).size.width * .003),
                  painter: BendedPainter(
                      color: AppColors.primaryColor.withOpacity(.3),
                      progress: 1,
                      curvature: MediaQuery.of(context).size.width * .003),
                ),
              ),
              Positioned(
                left: 0.0,
                right: 0.0,
                child: Text(
                  '${(value * 100).ceil()}%',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ],
          );
        },
        duration: const Duration(seconds: 3),
      ),
    );
  }
}

class BendedPainter extends CustomPainter {
  BendedPainter(
      {required this.progress,
      this.textStyle,
      this.color = Colors.blue,
      this.curvature = 1.3,
      this.strokeWidth = 30.0});

  final double progress;
  final Color color;
  final double curvature;
  final TextStyle? textStyle;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final startDegree = radians(210);
    final endDegree = radians(120);

    final Path path = Path();
    path.arcTo(
      Rect.fromCenter(center: Offset(w / 2, h), width: w, height: h * curvature),
      startDegree,
      endDegree * progress,
      false,
    );

    canvas.drawPath(path, paint);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

double radians(num deg) => deg * (pi / 180.0);
