import 'package:curve_design/colors.dart';
import 'package:flutter/material.dart';

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