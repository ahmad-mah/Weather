import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/extensions/theme_extensions.dart';
import '../../../../../../core/typography/app_styles.dart';
import '../../../../domain/entity/air_condition_item_model.dart';

class AirConditionItem extends StatelessWidget {
  const AirConditionItem({
    super.key,
    required this.data,
  });

  final AirConditionItemModel data;

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10.w,
        children: [
          Icon(
            data.icon,
            color: context.colors.onPrimary,
            size: 18.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                data.text,
                style: AppStyles.textStyleBold18(context).copyWith(
                  color: context.colors.onPrimary,
                ),
              ),
              Text(
                data.value,
                style: data.style ??
                    AppStyles.textStyleBoldl20(context).copyWith(
                      color: context.colors.onPrimary,
                    ),
              ),
            ],
          ),
        ]);
  }
}
