import 'package:flutter/material.dart';

import '../../../../../core/utils/app_strings.dart';

class WeatherProvider extends ChangeNotifier {
  String activeTab = AppStrings.today; // Default to 'Today'

  void setActiveTab(String tab) {
    activeTab = tab;
    notifyListeners();
  }
}
