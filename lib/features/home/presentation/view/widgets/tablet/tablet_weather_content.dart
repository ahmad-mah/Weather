import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../domain/entity/weather_entity.dart';
import '../search_text_field.dart';
import 'tablet_details_card.dart';
import 'tablet_header_section.dart';

class TabletWeatherContent extends StatelessWidget {
  const TabletWeatherContent({
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
        TabletHeaderSection(weather: weather),
        SizedBox(height: 8.h),
        TabletDetailsCard(weather: weather),
      ],
    );
  }
}
