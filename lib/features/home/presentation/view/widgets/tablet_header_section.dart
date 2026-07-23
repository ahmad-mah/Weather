import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'tablet_shimmers.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../core/widgets/styled_error_widget.dart';
import '../../controller/weather/weather_cubit.dart';

class TabletHeaderSection extends StatelessWidget {
  const TabletHeaderSection({
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
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      spacing: 8.0,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.weather.cityName,
                          style: AppStyles.textStyleBold40(context).copyWith(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          state.weather.region,
                          style: AppStyles.textStyleMedium18(context).copyWith(
                            color: AppColors.lightWhiteColor,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '${state.weather.temperature.toInt()}°',
                      style: AppStyles.textStyleBold55(context).copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                CachedNetworkImage(
                  imageUrl: state.weather.weatherConditionIcon,
                  scale: .5,
                )
              ],
            ),
          );
        }
        return const TabletHeaderShimmer();
      },
    );
  }
}
