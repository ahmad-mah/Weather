import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/data_source/weather_local_data_source.dart';
import '../../features/home/data/data_source/weather_remote_data_source.dart';
import '../../features/home/data/repository_impl/weather_repository_impl.dart';
import '../../features/home/domain/usecases/get_weather_usecase.dart';
import '../services/api_service.dart';
import '../services/internet_service.dart';
import '../services/location_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt
    ..registerLazySingleton(Dio.new)
    ..registerLazySingleton(() => ApiService(getIt<Dio>()))
    ..registerLazySingleton(
      () => WeatherRemoteDataSourceImpl(getIt<ApiService>()),
    )
    ..registerLazySingleton(WeatherLocalDataSource.new)
    ..registerLazySingleton(
      () => WeatherRepositoryImpl(
        getIt<WeatherRemoteDataSourceImpl>(),
        getIt<WeatherLocalDataSource>(),
        getIt<InternetService>(),
      ),
    )
    ..registerLazySingleton(LocationService.new)
    ..registerLazySingleton(InternetService.new)
    ..registerLazySingleton(
      () => GetWeatherUsecase(getIt<WeatherRepositoryImpl>()),
    );
}
