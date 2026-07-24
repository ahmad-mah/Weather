import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../extensions/theme_extensions.dart';
import '../typography/app_styles.dart';

class StyledErrorWidget extends StatelessWidget {
  const StyledErrorWidget({
    super.key, this.message,
  });
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: context.colors.secondary.withValues(alpha: 0.1),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(
                'assets/lotties/error.json',
                width: 120,
                height: 120,
              ),
              SizedBox(height: 16),
              Text(
                message ?? 'No Data Available',
                style: AppStyles.textStyleBoldl20(context),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
