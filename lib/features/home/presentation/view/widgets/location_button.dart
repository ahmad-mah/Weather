import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di/service_locator.dart';
import '../../../../../core/extensions/location_extensions.dart';
import '../../../../../core/extensions/theme_extensions.dart';
import '../../../../../core/helpers/styled_snackbar.dart';
import '../../../../../core/services/internet_service.dart';
import '../../../../../core/widgets/styled_circular_progress_indicator.dart';
import '../../controller/location/location_cubit.dart';
import '../../controller/weather/weather_cubit.dart';

class LocationButton extends StatelessWidget {
  const LocationButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return BlocListener<LocationCubit, LocationState>(
      listener: (context, state) {
        if (state is LocationFailed) {
          showStyledSnackBar(context, state.message);
        }
        if (state is LocationSuccess) {
          context.read<WeatherCubit>().searchWeather(
            state.position.formattedLocation,
          );
          context.read<WeatherCubit>().setPosition =
              state.position.formattedLocation;
        }
      },
      child: BlocBuilder<LocationCubit, LocationState>(
        buildWhen: (previous, current) => previous != current,
        builder: (context, state) {
          if (state is LocationLoading) {
            return const StyledLoading();
          }
          return Container(
            decoration: BoxDecoration(
              color: colors.surfaceContainerLow,
              borderRadius: BorderRadius.circular(16),
            ),
            child: IconButton(
              icon: const Icon(Icons.location_on_rounded),
              onPressed: () async {
                final hasInternet = await getIt<InternetService>()
                    .hasInternet();
                if (!context.mounted) return;
                if (!hasInternet) {
                  showStyledSnackBar(context, 'No internet connection');
                  return;
                }
                context.read<LocationCubit>().fetchCurrentLocation();
              },
            ),
          );
        },
      ),
    );
  }
}
