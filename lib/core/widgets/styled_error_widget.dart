import 'package:flutter/material.dart';

class StyledErrorWidget extends StatelessWidget {
  const StyledErrorWidget({
    super.key,  this.message,
  });
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message ?? 'No Data Available',
        style: const TextStyle(color: Colors.red),
      ),
    );
  }
}
