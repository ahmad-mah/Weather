// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:weather/core/error/failure.dart';
import 'package:weather/core/error/server_failure.dart';
import 'package:weather/features/home/domain/entity/weather_entity.dart';
import 'package:weather/features/home/domain/repository/weather_prediction_repository.dart';
import 'package:weather/features/home/domain/repository/weather_repository.dart';

class GetWeatherPredictionUsecase {
  final WeatherRepository weatherRepository;
  final WeatherPredictionRepository weatherPredictionRepository;

  GetWeatherPredictionUsecase({
    required this.weatherPredictionRepository,
    required this.weatherRepository,
  });

  Future<Either<Failure, int>> execute(dynamic position) async {
    final eitherWeatherEntity = await weatherRepository.getWeather(position);

    return eitherWeatherEntity.fold(
      (failure) => Left(ServerFailure(failure.message)),
      (weatherEntity) async {
        final features = _mapWeatherToFeatures(weatherEntity);
        return await weatherPredictionRepository.getWeatherPrediction(features);
      },
    );
  }

  List<int> _mapWeatherToFeatures(WeatherEntity weatherEntity) {
    int isRainy = weatherEntity.weatherCondition.contains('rain') ? 1 : 0;
    int isSunny = weatherEntity.weatherCondition.contains('sun') ? 1 : 0;
    int isHot = weatherEntity.temperature > 30 ? 1 : 0;
    int isMild =
        weatherEntity.temperature >= 20 && weatherEntity.temperature <= 30
            ? 1
            : 0;
    int isHumidityNormal = weatherEntity.humidity < 80 ? 1 : 0;

    return [isRainy, isSunny, isHot, isMild, isHumidityNormal];
  }
}
