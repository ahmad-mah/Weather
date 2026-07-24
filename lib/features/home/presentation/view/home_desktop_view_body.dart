import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/helpers/styled_snackbar.dart';
import '../../../../core/widgets/styled_error_widget.dart';
import '../../domain/entity/weather_entity.dart';
import '../controller/weather/weather_cubit.dart';
import '../controller/weather/weather_effect.dart';
import 'widgets/desktop/desktop_weather_content.dart';
import 'widgets/search_text_field.dart';

class HomeDesktopViewBody extends HookWidget {
  const HomeDesktopViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      final sub = context.read<WeatherCubit>().effects.listen((effect) {
        if (!context.mounted) return;
        switch (effect) {
          case ShowOfflineSnackbar():
            showStyledSnackBar(context, 'No internet connection');
          case ShowFailureSnackbar(message: final msg):
            showStyledSnackBar(context, msg);
        }
      });
      return sub.cancel;
    }, []);

    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 0.12.sw,
                    vertical: 32.h,
                  ),
                  child: switch (state) {
                    WeatherSuccess(weather: final w) => DesktopWeatherContent(weather: w),
                    WeatherFailed(message: final msg) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 1.sh * 0.2,
                      children: [
                        const SearchTextField(),
                        StyledErrorWidget(message: msg),
                      ],
                    ),
                    _ => Skeletonizer(
                      enabled: true,
                      child: DesktopWeatherContent(weather: WeatherEntity.fake()),
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