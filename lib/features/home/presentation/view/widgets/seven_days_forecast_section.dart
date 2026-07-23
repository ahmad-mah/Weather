import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/styled_error_widget.dart';
import '../../controller/weather/weather_cubit.dart';
import 'desktop_shimmers.dart';
import 'seven_days_forecast_item.dart';

class SevenDaysForecastSection extends StatelessWidget {
  const SevenDaysForecastSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 64.0),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 32.0,
            vertical: 32.0,
          ),
          child: Column(
            spacing: 16.0,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStrings.sevenDayForecast,
                style: AppStyles.textStyleBoldl20(context),
              ),
              Expanded(
                child: BlocConsumer<WeatherCubit, WeatherState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is WeatherFailed) {
                      return StyledErrorWidget(
                        message: state.message,
                      );
                    }
                    if (state is WeatherSuccess) {
                      return Column(
                        children: [
                          ...List.generate(
                            7,
                            (index) => Expanded(
                              child: SevenDaysForecastItem(
                                day: state.weather.weeklyForecast[index].day,
                                weatherCondition: state.weather
                                    .weeklyForecast[index].weatherCondition,
                                maxTemp:
                                    state.weather.weeklyForecast[index].maxTemp,
                                minTemp:
                                    state.weather.weeklyForecast[index].minTemp,
                                imageUrl:
                                    state.weather.weeklyForecast[index].iconUrl,
                              ),
                            ),
                          ),
                        ],
                      );
                    }

                    return const DesktopForecastShimmer();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
