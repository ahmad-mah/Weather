import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../domain/entity/weather_entity.dart';
import '../controller/weather/weather_cubit.dart';
import '../hooks/use_weather_effects.dart';
import 'widgets/mobile/mobile_weather_content.dart';
import 'widgets/weather_failed_content.dart';

class HomeMobileViewBody extends HookWidget {
  const HomeMobileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    useWeatherEffects(context);

    return BlocBuilder<WeatherCubit, WeatherState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 24.h,
              ).add(EdgeInsets.only(top: 16.h)),
              child: switch (state) {
                WeatherSuccess(weather: final w) => MobileWeatherContent(
                  weather: w,
                ),
                WeatherFailed(message: final msg) => WeatherFailedContent(msg),
                _ => Skeletonizer(
                  child: MobileWeatherContent(weather: WeatherEntity.fake()),
                ),
              },
            ),
          ),
        );
      },
    );
  }
}
