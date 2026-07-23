import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entity/weather_entity.dart';
import '../repository/weather_repository.dart';

class GetWeatherUsecase {
  final WeatherRepository weatherRepository;

  GetWeatherUsecase(this.weatherRepository);

  Future<Either<Failure, WeatherEntity>> execute(dynamic position) {
    return weatherRepository.getWeather(position);
  }
}
