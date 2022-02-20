import 'package:curve_design/widgets/oval_icon_button.dart';
import 'package:flutter/material.dart';
class MenuIcons extends StatelessWidget {
  const MenuIcons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          OvalIconButton(
            icon: Icons.calendar_today_outlined,
            onPressed: () {},
          ),
          OvalIconButton(
            icon: Icons.videogame_asset_outlined,
            onPressed: () {},
          ),
          OvalIconButton(
            icon: Icons.chat_outlined,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}