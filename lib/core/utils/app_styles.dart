import 'package:flutter/material.dart';

import 'app_colors.dart' show AppColors;
import 'size_config.dart';

abstract class AppStyles {
  static TextStyle textStyle13(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 13),
        color: Colors.grey[600],
        fontWeight: FontWeight.bold,
      );
  static TextStyle textStyleBold18(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 18),
        color: Colors.grey[600],
        fontWeight: FontWeight.bold,
      );
  static TextStyle textStyleMedium18(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 18),
        color: Colors.white54,
        fontWeight: FontWeight.w500,
      );

  static TextStyle textStyleMedium20(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 20),
        color: Colors.grey[100],
        fontWeight: FontWeight.w500,
        letterSpacing: 1,
      );
  static TextStyle textStyleNormal20(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 20),
        color: Colors.grey[600],
        fontWeight: FontWeight.normal,
      );
  static TextStyle textStyleBoldl20(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 20),
        color: AppColors.lightWhiteColor,
        fontWeight: FontWeight.bold,
      );

  static TextStyle textStyleBold30(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 30),
        color: Colors.white,
        fontWeight: FontWeight.bold,
      );
  static TextStyle textStyleBold35(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 35),
        color: Colors.white,
        fontWeight: FontWeight.bold,
      );
 static TextStyle textStyleBold40(BuildContext context) => TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 40),
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
      height: 1);
}

double getResponsiveFontSize(context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .6;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(context) {
  // var dispatcher = PlatformDispatcher.instance;
  // var physicalWidth = dispatcher.views.first.physicalSize.width;
  // var devicePixelRatio = dispatcher.views.first.devicePixelRatio;
  // double width = physicalWidth / devicePixelRatio;

  double width = MediaQuery.sizeOf(context).width;
  if (width < SizeConfig.tablet) {
    return width / 500;
  } else if (width < SizeConfig.desktop) {
    return width / 1200;
  } else {
    return width / 1920;
  }
}
