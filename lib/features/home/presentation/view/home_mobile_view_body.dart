import 'package:flutter/material.dart';

import 'widgets/mobile_details_card.dart';
import 'widgets/mobile_forecast_section.dart';
import 'widgets/mobile_header_section.dart';
import 'widgets/search_text_field.dart';

class HomeMobileViewBody extends StatelessWidget {
  const HomeMobileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            spacing: 32,
            children: [
              SearchTextField(),
              MobileHeaderSection(),
              MobileDetailsCard(),
              MobileForecastSection()
            ],
          ),
        ),
      ),
    );
  }
}
