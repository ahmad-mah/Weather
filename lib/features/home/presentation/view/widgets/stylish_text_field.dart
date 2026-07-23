import 'package:flutter/material.dart';

class StylishTextField extends StatelessWidget {
  const StylishTextField({
    super.key,
    required this.controller,
    this.onTap,
    this.onSubmitted,
    this.isTapped = false,
  });

  final TextEditingController controller;
  final void Function()? onTap;
  final void Function(String)? onSubmitted;
  final bool isTapped;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: 'Search for a city',
        hintStyle: TextStyle(color: Colors.blueGrey[300]),
        suffixIcon: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            transform: Matrix4.translationValues(isTapped ? 2 : 0, 0, 0),
            decoration: BoxDecoration(
              color: Colors.blue[200],
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(Icons.search, color: Colors.white),
          ),
        ),
        filled: true,
        fillColor: Colors.blue[50],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: Colors.blue,
          ),
        ),
      ),
      onSubmitted: onSubmitted,
    );
  }
}
