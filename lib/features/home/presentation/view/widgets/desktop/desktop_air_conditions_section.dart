import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/extensions/theme_extensions.dart';
import '../../../../../../core/constants/app_strings.dart';
import '../../../../../../core/typography/app_styles.dart';
import '../../../../domain/entity/air_condition_item_model.dart';
import '../../../../domain/entity/weather_entity.dart';
import 'desktop_air_condition_item.dart';

class DesktopAirConditionsSection extends StatelessWidget {
  const DesktopAirConditionsSection({super.key, required this.weather});

  final WeatherEntity weather;

  @override
  Widget build(BuildContext context) {
    List<AirConditionItemModel> items = [
      AirConditionItemModel(
        text: AppStrings.realFeel,
        icon: Icons.device_thermostat_rounded,
        value: '${weather.temperatureFeelsLike}°',
      ),
      AirConditionItemModel(
        text: AppStrings.wind,
        icon: Icons.air_rounded,
        value: '${weather.windSpeed} km/h',
      ),
      AirConditionItemModel(
        text: AppStrings.humidity,
        icon: Icons.water_drop_rounded,
        value: '${weather.humidity}%',
      ),
      AirConditionItemModel(
        text: AppStrings.uvIndex,
        icon: Icons.brightness_5_rounded,
        value: '${weather.uv}',
      ),
      AirConditionItemModel(
        text: AppStrings.pressure,
        icon: Icons.speed_rounded,
        value: '${weather.pressure} hPa',
      ),
      AirConditionItemModel(
        text: AppStrings.windDir,
        icon: Icons.compass_calibration_rounded,
        value: weather.windDir,
      ),
      AirConditionItemModel(
        text: AppStrings.precipitation,
        icon: Icons.umbrella_rounded,
        value: '${weather.precipMm} mm',
      ),
      AirConditionItemModel(
        text: AppStrings.cloudCover,
        icon: Icons.cloud_rounded,
        value: '${weather.cloud}%',
      ),
    ];
    return Container(
      decoration: BoxDecoration(
        color: context.colors.secondary,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 32.h, horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppStrings.airCondition,
              style: AppStyles.textStyleBoldl20(context),
            ),
            SizedBox(height: 32.h),
            Row(
              children: [
                for (var i = 0; i < 4; i++)
                  Expanded(child: DesktopAirConditionItem(data: items[i])),
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                for (var i = 4; i < 8; i++)
                  Expanded(child: DesktopAirConditionItem(data: items[i])),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
