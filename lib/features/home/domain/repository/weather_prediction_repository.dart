import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';

abstract class WeatherPredictionRepository {
  Future<Either<Failure, int>> getWeatherPrediction(List<int> features);
}
