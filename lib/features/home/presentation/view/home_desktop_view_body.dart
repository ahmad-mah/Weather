import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../domain/entity/weather_entity.dart';
import '../controller/weather/weather_cubit.dart';
import '../hooks/use_weather_effects.dart';
import 'widgets/desktop/desktop_weather_content.dart';
import 'widgets/weather_failed_content.dart';

class HomeDesktopViewBody extends HookWidget {
  const HomeDesktopViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    useWeatherEffects(context);

    return BlocBuilder<WeatherCubit, WeatherState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 0.18.sw,
                    vertical: 32.h,
                  ),
                  child: switch (state) {
                    WeatherSuccess(weather: final w) => DesktopWeatherContent(
                      weather: w,
                    ),
                    WeatherFailed(message: final msg) => WeatherFailedContent(
                      msg,
                    ),
                    _ => Skeletonizer(
                      child: DesktopWeatherContent(
                        weather: WeatherEntity.fake(),
                      ),
                    ),
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
