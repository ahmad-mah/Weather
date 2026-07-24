import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

abstract class AppStyles {
  static TextStyle textStyleBold18(BuildContext context) => TextStyle(
    fontSize: getResponsiveFontSize(context, fontSize: 18),
    color: Colors.grey[600],
    fontWeight: FontWeight.bold,
  );

  static TextStyle textStyleBoldl20(BuildContext context) => TextStyle(
    fontSize: getResponsiveFontSize(context, fontSize: 20),
    color: AppColors.lightWhite,
    fontWeight: FontWeight.bold,
  );

  static TextStyle textStyleBold30(BuildContext context) => TextStyle(
    fontSize: getResponsiveFontSize(context, fontSize: 30),
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static TextStyle textStyleBold55(BuildContext context) => TextStyle(
    fontSize: getResponsiveFontSize(context, fontSize: 55),
    color: Colors.black,
    fontWeight: FontWeight.bold,
  );

  static TextStyle textStyleBold70(BuildContext context) => TextStyle(
    fontSize: getResponsiveFontSize(context, fontSize: 70),
    color: Colors.white,
    fontWeight: FontWeight.bold,
    height: 1,
  );
}

double getResponsiveFontSize(BuildContext context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .7;
  double upperLimit = fontSize * .9;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  double width = MediaQuery.sizeOf(context).width;
  if (width < 800) {
    return width / 500;
  } else if (width < 1100) {
    return width / 1100;
  } else {
    return width / 1920;
  }
}
