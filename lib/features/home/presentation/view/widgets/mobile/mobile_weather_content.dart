import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../domain/entity/weather_entity.dart';
import '../search_text_field.dart';
import 'mobile_details_card.dart';
import 'mobile_header_section.dart';

class MobileWeatherContent extends StatelessWidget {
  const MobileWeatherContent({
    super.key,
    required this.weather,
  });

  final WeatherEntity weather;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 36.h,
      children: [
        const SearchTextField(),
        MobileHeaderSection(weather: weather),
        SizedBox(height: 8.h),
        MobileDetailsCard(weather: weather),
      ],
    );
  }
}
