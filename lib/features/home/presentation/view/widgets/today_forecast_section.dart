import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/styled_error_widget.dart';
import '../../controller/weather/weather_cubit.dart';
import 'tablet_shimmers.dart';
import 'today_forecast_item.dart';

class TodayForecastSection extends StatelessWidget {
  const TodayForecastSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is WeatherFailed) {
          const StyledErrorWidget();
        }

        if (state is WeatherSuccess) {
          return Container(
            decoration: BoxDecoration(
              color: AppColors.secondaryColor,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 32.0, horizontal: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.todayForcast,
                    style: AppStyles.textStyleBoldl20(context),
                  ),
                  const SizedBox(height: 16.0),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ...List.generate(
                          7,
                          (index) => TodayForecastItem(
                            imageUrl:
                                state.weather.hourlyForecast[index].iconUrl,
                            temperature:
                                state.weather.hourlyForecast[index].temperature,
                            time: state.weather.hourlyForecast[index].time,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return const TabletAirConditionsShimmer();
      },
    );
  }
}
