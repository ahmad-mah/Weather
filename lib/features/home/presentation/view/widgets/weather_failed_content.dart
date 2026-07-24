import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/widgets/styled_error_widget.dart';
import 'search_text_field.dart';

class WeatherFailedContent extends StatelessWidget {
  const WeatherFailedContent(this.message, {super.key});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 1.sh * 0.2,
      children: [
        const SearchTextField(),
        StyledErrorWidget(message: message),
      ],
    );
  }
}
