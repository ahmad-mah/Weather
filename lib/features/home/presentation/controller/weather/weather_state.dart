part of 'weather_cubit.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherSuccess extends WeatherState {
  final WeatherEntity weather;

  const WeatherSuccess({required this.weather});

  @override
  List<Object> get props => [weather];
}

class WeatherFailed extends WeatherState {
  final String message;

  const WeatherFailed({required this.message});

  @override
  List<Object> get props => [message];
}
