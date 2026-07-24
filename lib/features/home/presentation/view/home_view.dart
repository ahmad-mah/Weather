import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extensions/location_extensions.dart';
import '../../../../core/extensions/theme_extensions.dart';
import '../controller/location/location_cubit.dart';
import '../controller/weather/weather_cubit.dart';
import 'home_desktop_view_body.dart';
import 'home_mobile_view_body.dart';
import 'home_tablet_view_body.dart';
import 'widgets/home_adaptive_layout.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LocationCubit, LocationState>(
      listener: (context, state) {
        final weather = context.read<WeatherCubit>();
        if (weather.state is! WeatherInitial) return;

        if (state is LocationSuccess) {
          weather.searchWeather(state.position.formattedLocation);
        }
        if (state is LocationFailed) {
          weather.searchWeather('egypt');
        }
      },
      child: Scaffold(
        backgroundColor: context.colors.primary,
        body: HomeAdaptiveLayout(
          mobileLayout: (context) => const HomeMobileViewBody(),
          tabletLayout: (context) => const HomeTabletViewBody(),
          desktopLayout: (context) => const HomeDesktopViewBody(),
        ),
      ),
    );
  }
}