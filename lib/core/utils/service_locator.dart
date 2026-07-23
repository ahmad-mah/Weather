import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/data_source/weather_prediction_data_source.dart';
import '../../features/home/data/data_source/weather_remote_data_source.dart';
import '../../features/home/data/repository_impl/weather_prediction_repository_impl.dart';
import '../../features/home/data/repository_impl/weather_repository_impl.dart';
import '../../features/home/domain/usecases/get_weather_prediction_usecase.dart';
import '../../features/home/domain/usecases/get_weather_usecase.dart';
import 'api_service.dart';
import 'location_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt
    ..registerLazySingleton(() => Dio())
    ..registerLazySingleton(() => ApiService(getIt<Dio>()))
    ..registerLazySingleton(
        () => WeatherRemoteDataSourceImpl(getIt<ApiService>()))
    ..registerLazySingleton(
        () => WeatherRepositoryImpl(getIt<WeatherRemoteDataSourceImpl>()))
    ..registerLazySingleton(() => LocationService())
    ..registerLazySingleton(() => WeatherPredictionDataSourceImpl(getIt()))
    ..registerLazySingleton(() => WeatherPredictionRepositoryImpl(
        getIt<WeatherPredictionDataSourceImpl>()))
    ..registerLazySingleton(() => GetWeatherPredictionUsecase(
        weatherRepository: getIt<WeatherRepositoryImpl>(),
        weatherPredictionRepository: getIt<WeatherPredictionRepositoryImpl>()))
    ..registerLazySingleton(
        () => GetWeatherUsecase(getIt<WeatherRepositoryImpl>()));
}
