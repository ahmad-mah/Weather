import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';

class DetailsCardInfo extends StatelessWidget {
  const DetailsCardInfo({
    super.key,
    required this.text,
    required this.icon,
  });
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        Icon(icon, color: Colors.white),
        Text(
          text,
          style: AppStyles.textStyleBold18(context).copyWith(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
