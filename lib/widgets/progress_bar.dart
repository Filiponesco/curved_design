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
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: progress,
        child: Container(
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: AppBorders.bigCorner,
          ),
          child: Center(
            child: FittedBox(
              child: Text(
                '${(progress * 100).ceil()}%',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: AppColors.whiteColor, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CurvedProgressBar extends StatelessWidget {
  const CurvedProgressBar({Key? key, required this.progress, this.height = 30.0, this.color = AppColors.primaryColor})
      : super(key: key);
  final double progress;
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28,
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: CustomPaint(
        painter: BendedPainter(color: AppColors.primaryColor.withOpacity(.3), progress: 1),
      ),
    );
  }
}

class BendedPainter extends CustomPainter {
  final Color color;
  final double progress;

  BendedPainter({this.color = AppColors.primaryColor, required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 30
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final Path path = Path()
      ..moveTo(0, size.height);
      //..quadraticBezierTo(size.width / 2, 0, size.width, size.height);
    path.arcToPoint(Offset(size.width, size.height,), radius: Radius.circular(500.0));
    //path.arcTo(Rect.fromCenter(center: Offset(size.width / 2, size.height /2), width: size.width, height: size.height), 0, 3.14, false);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
