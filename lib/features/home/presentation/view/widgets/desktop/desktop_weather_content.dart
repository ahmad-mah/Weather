import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../domain/entity/weather_entity.dart';
import '../search_text_field.dart';
import 'air_conditions_section.dart';
import 'desktop_header_section.dart';

class DesktopWeatherContent extends StatelessWidget {
  const DesktopWeatherContent({super.key, required this.weather});

  final WeatherEntity weather;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 32.w,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchTextField(),
              DesktopHeaderSection(weather: weather),
              SizedBox(height: 60.h),
              AirConditionsSection(weather: weather),
            ],
          ),
        ),
      ],
    );
  }
}
