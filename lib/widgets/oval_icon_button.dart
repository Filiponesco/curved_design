import 'package:flutter/material.dart';
class OvalIconButton extends StatelessWidget {
  const OvalIconButton({Key? key, required this.icon, this.onPressed}) : super(key: key);
  final IconData icon;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
          color: Colors.transparent,
          child: IconButton(
            icon: Icon(icon),
            onPressed: onPressed,
          )),
    );
  }
}