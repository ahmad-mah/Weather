import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/extensions/theme_extensions.dart';
import '../../../../../../core/typography/app_styles.dart';

class DetailsCardInfo extends StatelessWidget {
  const DetailsCardInfo({super.key, required this.text, required this.icon});
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8.w,
      children: [
        Icon(icon, color: context.colors.onPrimary),
        Text(
          text,
          style: AppStyles.textStyleBold18(
            context,
          ).copyWith(color: context.colors.onPrimary),
        ),
      ],
    );
  }
}
