import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/extensions/theme_extensions.dart';
import '../../../../../../core/typography/app_styles.dart';
import '../../../../domain/entity/air_condition_item_model.dart';

class DesktopAirConditionItem extends StatelessWidget {
  const DesktopAirConditionItem({super.key, required this.data});

  final AirConditionItemModel data;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10.w,
      children: [
        Icon(data.icon, color: context.colors.onPrimary, size: 14.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.text,
              style: AppStyles.textStyleBoldl20(
                context,
              ).copyWith(color: context.colors.onPrimary),
            ),
            Text(
              data.value,
              style:
                  data.style ??
                  AppStyles.textStyleBoldl20(
                    context,
                  ).copyWith(color: context.colors.onPrimary),
            ),
          ],
        ),
      ],
    );
  }
}
