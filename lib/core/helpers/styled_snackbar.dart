import 'package:flutter/material.dart';

void showStyledSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.redAccent,
      content: Text(message),
    ),
  );
}
