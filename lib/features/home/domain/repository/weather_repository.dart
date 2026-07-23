import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entity/weather_entity.dart';

abstract class WeatherRepository {
  Future<Either<Failure, WeatherEntity>> getWeather(dynamic position);
}
