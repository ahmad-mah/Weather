import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/error/network_failure.dart';
import '../../../../core/error/server_failure.dart';
import '../../../../core/services/internet_service.dart';
import '../../domain/entity/weather_entity.dart';
import '../../domain/repository/weather_repository.dart';
import '../data_source/weather_local_data_source.dart';
import '../data_source/weather_remote_data_source.dart';

class WeatherRepositoryImpl implements WeatherRepository {

  WeatherRepositoryImpl(
    this.remoteDataSource,
    this.localDataSource,
    this.internetService,
  );
  final WeatherRemoteDataSource remoteDataSource;
  final WeatherLocalDataSource localDataSource;
  final InternetService internetService;

  @override
  Future<WeatherEntity?> getCachedWeather() {
    return localDataSource.getWeather();
  }

  // Cache-first: serve cache, then fetch fresh; fall back to stale cache on API error
  @override
  Future<Either<Failure, WeatherEntity>> getWeather(dynamic position) async {
    final cached = await localDataSource.getWeather();

    if (!await internetService.hasInternet()) {
      if (cached != null) return Right(cached);
      return Left(NetworkFailure('No internet connection'));
    }

    try {
      final weather = await remoteDataSource.getWeather(position);
      await localDataSource.saveWeather(weather);
      return Right(weather);
    } catch (e) {
      if (e is DioException) return Left(ServerFailure.fromDioException(e));
      if (e is ApiException) return Left(ServerFailure(e.message));
      return Left(ServerFailure(e.toString()));
    }
  }
}
