import 'package:flutter/material.dart';

import '../../../../../core/utils/app_strings.dart';
import 'styled_tab_button.dart';

class MobileForecastTabView extends StatelessWidget {
  const MobileForecastTabView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              StyledTabButton(title: AppStrings.today),
              StyledTabButton(title: AppStrings.thisWeek),
            ],
          ),
        ),
        Divider(color: Colors.white54),
      ],
    );
  }
}
