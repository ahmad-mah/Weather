import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';

class SevenDaysForecastItem extends StatelessWidget {
  const SevenDaysForecastItem({
    super.key,
    required this.day,
    required this.weatherCondition,
    required this.maxTemp,
    required this.minTemp,
    required this.imageUrl,
  });

  final String day;
  final String weatherCondition;
  final double maxTemp;
  final double minTemp;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          day,
          style: AppStyles.textStyleMedium18(context),
        ),
        const SizedBox(width: 32.0),
        Expanded(
          child: Row(
            children: [
              CachedNetworkImage(imageUrl: imageUrl),
              const SizedBox(width: 8.0),
              Text(
                weatherCondition,
                style: AppStyles.textStyleBold18(context).copyWith(
                  color: AppColors.lightWhiteColor,
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Text(
              '$maxTemp',
              style: AppStyles.textStyleBoldl20(context).copyWith(
                color: AppColors.lightWhiteColor,
              ),
            ),
            Text(
              '/$minTemp',
              style: AppStyles.textStyleBoldl20(context).copyWith(
                color: Colors.white54,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
