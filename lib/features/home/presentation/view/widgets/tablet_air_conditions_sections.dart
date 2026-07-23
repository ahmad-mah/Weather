import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/features/home/presentation/view/widgets/tablet_shimmers.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/styled_error_widget.dart';
import '../../controller/weather/weather_cubit.dart';
import 'air_condition_item.dart';

class TabletAirConditionsSection extends StatelessWidget {
  const TabletAirConditionsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WeatherCubit, WeatherState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is WeatherFailed) {
          return StyledErrorWidget(
            message: state.message,
          );
        }

        if (state is WeatherSuccess) {
          return Container(
            height: 210,
            decoration: BoxDecoration(
              color: AppColors.secondaryColor,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 24.0, horizontal: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.airCondition,
                    style: AppStyles.textStyleBoldl20(context),
                  ),
                  const SizedBox(height: 12.0),
                  Flexible(
                    child: Row(
                      children: [
                        Flexible(
                          child: AirConditionItem(
                            text: AppStrings.realFeel,
                            icon: Icons.device_thermostat_rounded,
                            value: '${state.weather.temperatureFeelsLike}°',
                            style: AppStyles.textStyleBold18(context).copyWith(
                              color: AppColors.lightWhiteColor,
                            ),
                          ),
                        ),
                        Flexible(
                          child: AirConditionItem(
                            text: AppStrings.wind,
                            value: '${state.weather.windSpeed} km/h',
                            icon: Icons.air_rounded,
                            style: AppStyles.textStyleBold18(context).copyWith(
                              color: AppColors.lightWhiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Flexible(
                    child: Row(
                      children: [
                        Flexible(
                          child: AirConditionItem(
                            text: AppStrings.humidity,
                            value: '${state.weather.humidity}%',
                            icon: Icons.water_drop_rounded,
                            style: AppStyles.textStyleBold18(context).copyWith(
                              color: AppColors.lightWhiteColor,
                            ),
                          ),
                        ),
                        Flexible(
                          child: AirConditionItem(
                            text: AppStrings.uvIndex,
                            value: '${state.weather.uv}',
                            icon: Icons.brightness_5_rounded,
                            style: AppStyles.textStyleBold18(context).copyWith(
                              color: AppColors.lightWhiteColor,
                            ),
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
