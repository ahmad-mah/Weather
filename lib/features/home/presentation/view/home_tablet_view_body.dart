import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../domain/entity/weather_entity.dart';
import '../controller/weather/weather_cubit.dart';
import '../hooks/use_weather_effects.dart';
import 'widgets/tablet/tablet_weather_content.dart';
import 'widgets/weather_failed_content.dart';

class HomeTabletViewBody extends HookWidget {
  const HomeTabletViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    useWeatherEffects(context);

    return BlocBuilder<WeatherCubit, WeatherState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 0.15.sw,
                  vertical: 16.h,
                ),
                child: switch (state) {
                  WeatherSuccess(weather: final w) => TabletWeatherContent(weather: w),
                  WeatherFailed(message: final msg) => WeatherFailedContent(msg),
                  _ => Skeletonizer(
                    enabled: true,
                    child: TabletWeatherContent(weather: WeatherEntity.fake()),
                  ),
                },
              ),
            ),
          ),
        );
      },
    );
  }
}