import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/styled_error_widget.dart';
import '../../controller/weather/weather_cubit.dart';
import '../../controller/weather/weather_provider.dart';
import 'mobile_forecast_item.dart';
import 'mobile_shimmers.dart';

class MobileForecastListView extends StatelessWidget {
  const MobileForecastListView({
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
          return Consumer<WeatherProvider>(builder: (context, provider, child) {
            return provider.activeTab == AppStrings.today
                ? ListView(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      ...List.generate(
                        7,
                        (index) => MobileForecastItem(
                          time: state.weather.hourlyForecast[index].time,
                          imageUrl: state.weather.hourlyForecast[index].iconUrl,
                          temperature:
                              state.weather.hourlyForecast[index].temperature,
                        ),
                      ),
                    ],
                  )
                : ListView(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      ...List.generate(
                        7,
                        (index) => MobileForecastItem(
                          time: state.weather.weeklyForecast[index].day,
                          imageUrl: state.weather.weeklyForecast[index].iconUrl,
                          temperature:
                              state.weather.weeklyForecast[index].maxTemp,
                        ),
                      ),
                    ],
                  );
          });
        }

        return const MobileHourlyForecastShimmer();
      },
    );
  }
}
