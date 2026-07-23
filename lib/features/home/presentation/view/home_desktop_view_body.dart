import 'package:flutter/material.dart';

import 'widgets/air_conditions_section.dart';
import 'widgets/desktop_header_section.dart';
import 'widgets/search_text_field.dart';
import 'widgets/seven_days_forecast_section.dart';
import 'widgets/today_forecast_section.dart';

class HomeDesktopViewBody extends StatelessWidget {
  const HomeDesktopViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 32.0,
              horizontal: 32.0,
            ),
            child: Row(
              spacing: 32.0,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SearchTextField(),
                      Expanded(
                        child: DesktopHeaderSection(),
                      ),
                      SizedBox(height: 32.0),
                      Expanded(
                        child: TodayForecastSection(),
                      ),
                      SizedBox(height: 16.0),
                      Expanded(
                        child: AirConditionsSection(),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SevenDaysForecastSection(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
