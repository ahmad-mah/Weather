import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/service_locator.dart';
import '../../domain/usecases/get_weather_usecase.dart';
import '../controller/location/location_cubit.dart';
import '../controller/weather/prediction_cubit.dart';
import '../controller/weather/weather_cubit.dart';
import '../controller/weather/weather_provider.dart';
import 'home_desktop_view_body.dart';
import 'home_mobile_view_body.dart';
import 'home_tablet_view_body.dart';
import 'widgets/animated_floating_button.dart';
import 'widgets/home_adaptive_layout.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WeatherCubit>(
          create: (context) {
            return WeatherCubit(
            getIt<GetWeatherUsecase>(),
          )..getWeather('Egypt');
          },
        ),
        BlocProvider<LocationCubit>(
          create: (context) => LocationCubit(getIt()),
        ),
        ChangeNotifierProvider(create: (context) => WeatherProvider(),lazy: true,),
        BlocProvider(
          create: (context) => PredictionCubit(getIt()),
        ),
      ],
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: HomeAdaptiveLayout(
          mobileLayout: (context) => const HomeMobileViewBody(),
          tabletLayout: (context) => const HomeTabletViewBody(),
          desktopLayout: (context) => const HomeDesktopViewBody(),
        ),
        floatingActionButton: const AnimatedFloatingButton(),
      ),
    );
  }
}
