import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/extensions/theme_extensions.dart';
import '../../../../domain/entity/weather_entity.dart';
import '../details_card_info.dart';

class MobileDetailsCard extends StatelessWidget {
  const MobileDetailsCard({super.key, required this.weather});

  final WeatherEntity weather;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [context.colors.secondary, context.colors.primary],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        spacing: 12,
        children: [
          _DetailsCardRow(
            first: DetailsCardInfo(icon: Icons.water_drop, text: '${weather.humidity}%'),
            second: DetailsCardInfo(icon: Icons.thermostat, text: '${weather.temperatureFeelsLike}°'),
          ),
          _DetailsCardRow(
            first: DetailsCardInfo(icon: Icons.air_rounded, text: '${weather.windSpeed} km/h'),
            second: DetailsCardInfo(icon: Icons.compass_calibration_rounded, text: weather.windDir),
          ),
        ],
      ),
    );
  }
}

class _DetailsCardRow extends StatelessWidget {
  const _DetailsCardRow({
    required this.first,
    required this.second,
  });

  final DetailsCardInfo first;
  final DetailsCardInfo second;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.colors.onPrimary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [first, second],
      ),
    );
  }
}
