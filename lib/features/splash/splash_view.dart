import 'package:flutter/material.dart';

import '../../core/extensions/theme_extensions.dart';
import 'splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      body: const SplashViewBody(),
    );
  }
}
