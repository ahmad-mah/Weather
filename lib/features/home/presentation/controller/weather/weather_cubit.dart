import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/services/internet_service.dart';
import '../../../domain/entity/weather_entity.dart';
import '../../../domain/usecases/get_weather_usecase.dart';
import 'weather_effect.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.getWeatherUsecase, this.internetService)
      : super(WeatherInitial());

  final GetWeatherUsecase getWeatherUsecase;
  final InternetService internetService;

  final _effectController = StreamController<WeatherEffect>.broadcast();
  Stream<WeatherEffect> get effects => _effectController.stream;

  var _position = 'egypt';

  String get getPosition => _position;

  set setPosition(String value) {
    _position = value;
  }

  void init() async {
    final cached = await getWeatherUsecase.getCachedWeather();
    if (cached != null) {
      emit(WeatherSuccess(weather: cached));
    }
  }

  void searchWeather(dynamic position) async {
    if (!await internetService.hasInternet()) {
      _effectController.add(const ShowOfflineSnackbar());
      return;
    }

    emit(WeatherLoading());

    final result = await getWeatherUsecase.execute(position);
    result.fold(
      (failure) {
        _effectController.add(ShowFailureSnackbar(failure.message));
        emit(WeatherFailed(message: failure.message));
      },
      (weather) => emit(WeatherSuccess(weather: weather)),
    );
  }

  @override
  Future<void> close() {
    _effectController.close();
    return super.close();
  }
}
