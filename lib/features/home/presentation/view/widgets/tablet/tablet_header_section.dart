import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/extensions/theme_extensions.dart';
import '../../../../../../core/typography/app_styles.dart';
import '../../../../domain/entity/weather_entity.dart';

class TabletHeaderSection extends StatelessWidget {
  const TabletHeaderSection({super.key, required this.weather});

  final WeatherEntity weather;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _CityName(weather: weather),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _TemperatureRow(weather: weather),
              _WeatherCondition(weather: weather),
            ],
          ),
        ],
      ),
    );
  }
}

class _CityName extends StatelessWidget {
  const _CityName({required this.weather});

  final WeatherEntity weather;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        textAlign: TextAlign.start,
        weather.cityName,
        style: AppStyles.textStyleBold55(context).copyWith(color: context.colors.onPrimary),
      ),
    );
  }
}

class _TemperatureRow extends StatelessWidget {
  const _TemperatureRow({required this.weather});

  final WeatherEntity weather;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${weather.temperature.toInt()}°',
          style: AppStyles.textStyleBold70(context).copyWith(color: context.colors.onPrimary),
        ),
        _WeatherIcon(iconUrl: weather.weatherConditionIcon),
      ],
    );
  }
}

class _WeatherIcon extends StatelessWidget {
  const _WeatherIcon({required this.iconUrl});

  final String iconUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: iconUrl,
      scale: .45,
      placeholder: (_, _) => SizedBox(
        height: 60.w,
        width: 60.w,
        child: const CircularProgressIndicator(),
      ),
      errorWidget: (_, _, _) => const Icon(Icons.cloud),
    );
  }
}

class _WeatherCondition extends StatelessWidget {
  const _WeatherCondition({required this.weather});

  final WeatherEntity weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          weather.weatherCondition,
          style: AppStyles.textStyleBold30(context).copyWith(color: context.colors.onPrimary),
        ),
        SizedBox(height: 4.h),
        Text(
          '${weather.formattedDay}, ${weather.formattedTime}',
          style: AppStyles.textStyleBoldl20(context).copyWith(color: context.colors.onPrimary.withValues(alpha: 0.54)),
        ),
      ],
    );
  }
}