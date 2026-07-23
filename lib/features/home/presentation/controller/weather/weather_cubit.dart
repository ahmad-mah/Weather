import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entity/weather_entity.dart';
import '../../../domain/usecases/get_weather_usecase.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.getWeatherUsecase) : super(WeatherInitial());

  final GetWeatherUsecase getWeatherUsecase;

  var _position = 'egypt'; 
  String? _lastRequestedPosition;

  get getPosition => _position;

  set setPosition(value) {
    _position = value;
  }

  void getWeather(dynamic position) async {
    if (_lastRequestedPosition == position) {
      return; 
    } 
    _lastRequestedPosition = position;

    emit(WeatherLoading());

    final result = await getWeatherUsecase.execute(position);
    result.fold(
      (failure) => emit(WeatherFailed(message: failure.message)),
      (weather) => emit(WeatherSuccess(weather: weather)),
    );
  }
}