import 'package:curve_design/colors.dart';
import 'package:flutter/material.dart';

class HeartIcon extends StatefulWidget {
  const HeartIcon({Key? key}) : super(key: key);

  @override
  State<HeartIcon> createState() => _HeartIconState();
}

class _HeartIconState extends State<HeartIcon> with SingleTickerProviderStateMixin {
  late final Animation<double> _sizeAnimation;
  late final AnimationController _controller;
  bool _isSelected = false;
  final maxSize = 30.0;

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));

    _sizeAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween<double>(begin: 16, end: 30), weight: 50),
      TweenSequenceItem(tween: Tween<double>(begin: 30, end: 16), weight: 50),
    ]).animate(_controller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context, child) {
        return Container(
          width: maxSize,
          height: maxSize,
          child: Center(
            child: Material(
              elevation: 8.0,
              color: Colors.white,
              shape: CircleBorder(),
              child: InkWell(
                customBorder: CircleBorder(),
                onTap: () {
                  setState(() {
                    _isSelected = !_isSelected;
                  });
                  if (_controller.isCompleted) {
                    _controller.reverse();
                  } else {
                    _controller.forward();
                  }
                },
                child: Container(
                  padding: EdgeInsets.all(4.0),
                  child: Image.asset(
                    'assets/heart.png',
                    height: _sizeAnimation.value,
                    color: _isSelected ? null : AppColors.greyColor,
                  ),
                ),
              ),
            ),
          ),
        );
      },
      animation: _sizeAnimation,
    );
  }
}
