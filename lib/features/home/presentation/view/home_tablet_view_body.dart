import 'package:flutter/material.dart';

import 'widgets/mobile_forecast_tab_view.dart';
import 'widgets/search_text_field.dart';
import 'widgets/tablet_air_conditions_sections.dart';
import 'widgets/tablet_forecast_listview.dart';
import 'widgets/tablet_header_section.dart';

class HomeTabletViewBody extends StatelessWidget {
  const HomeTabletViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(slivers: [
      SliverFillRemaining(
        hasScrollBody: false,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            spacing: 40,
            children: [
              SearchTextField(),
              SizedBox(height: 200,child: TabletHeaderSection()),
              TabletAirConditionsSection(),
              MobileForecastTabView(),
              TabletForecastListView(),
            ],
          ),
        ),
      ),
    ]);
  }
}
