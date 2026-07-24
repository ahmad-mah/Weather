import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/domain/usecases/get_weather_usecase.dart';
import '../../features/home/presentation/controller/location/location_cubit.dart';
import '../../features/home/presentation/controller/weather/weather_cubit.dart';
import '../../features/home/presentation/view/home_view.dart';
import '../../features/splash/splash_view.dart';
import '../di/service_locator.dart';
import '../services/internet_service.dart';

abstract class AppRouter {
  static const kHome = '/homeView';

  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: kHome,
        builder: (BuildContext context, GoRouterState state) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<WeatherCubit>(
                create: (context) {
                  return WeatherCubit(
                    getIt<GetWeatherUsecase>(),
                    getIt<InternetService>(),
                  )..init();
                },
              ),
              BlocProvider<LocationCubit>(
                create: (context) {
                  final cubit = LocationCubit(getIt());

                  cubit.fetchCurrentLocation();

                  return cubit;
                },
              ),
            ],
            child: const HomeView(),
          );
        },
      ),
    ],
  );
}
