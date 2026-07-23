import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class AirConditionItem extends StatelessWidget {
  const AirConditionItem({
    super.key,
    required this.icon,
    required this.value,
    required this.text,
    this.style,
  });

  final IconData icon;
  final String value;
  final String text;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Icon(
            icon,
            color: AppColors.lightWhiteColor,
            size: 24,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                text,
                style: AppStyles.textStyleBoldl20(context).copyWith(
                  color: AppColors.lightWhiteColor,
                ),
              ),
              Text(
                value,
                style: style ??
                    AppStyles.textStyleBold35(context).copyWith(
                      color: AppColors.lightWhiteColor,
                    ),
              ),
            ],
          ),
        ]);
  }
}
