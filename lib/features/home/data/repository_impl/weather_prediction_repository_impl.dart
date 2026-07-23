import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/error/server_failure.dart';
import '../data_source/weather_prediction_data_source.dart';
import '../../domain/repository/weather_prediction_repository.dart';

class WeatherPredictionRepositoryImpl implements WeatherPredictionRepository {
  final WeatherPredictionDataSource weatherPredictionDataSource;

  WeatherPredictionRepositoryImpl(this.weatherPredictionDataSource);
  @override
  Future<Either<Failure, int>> getWeatherPrediction(List<int> features) async {
    try {
      final prediction =
          await weatherPredictionDataSource.getWeatherPrediction(features);
      return Right(prediction);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
