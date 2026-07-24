import 'package:flutter/material.dart';

class AirConditionItemModel {
  final String text;
  final IconData icon;
  final String value;
  final TextStyle? style;

  const AirConditionItemModel({
    required this.text,
    required this.icon,
    required this.value,
    this.style,
  });
}