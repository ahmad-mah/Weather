import 'package:flutter/material.dart';

import 'mobile_forecast_list_view.dart';
import 'mobile_forecast_tab_view.dart';

class MobileForecastSection extends StatelessWidget {
  const MobileForecastSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const MobileForecastTabView(),
        const SizedBox(height: 10),
        SizedBox(
            height: MediaQuery.sizeOf(context).height*.21,
            child: const MobileForecastListView())
      ],
    );
  }
}
