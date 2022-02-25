import 'package:curve_design/colors.dart';
import 'package:curve_design/widgets/view_all_text.dart';
import 'package:flutter/material.dart';

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