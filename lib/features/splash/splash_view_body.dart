import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../core/utils/app_lotties.dart';
import '../../core/utils/app_router.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(AppLotties.splashLottie, onLoaded: (composition) {
        Future.delayed(composition.duration, () async {
          if (context.mounted) {
            GoRouter.of(context).pushReplacement(AppRouter.kHome);
          }
        });
      }),
    );
  }
}
