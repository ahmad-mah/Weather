part of 'weather_cubit.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object> get props => [];
}

class WeatherInitial extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherSuccess extends WeatherState {

  const WeatherSuccess({required this.weather});
  final WeatherEntity weather;

  @override
  List<Object> get props => [weather];
}

class WeatherFailed extends WeatherState {

  const WeatherFailed({required this.message});
  final String message;

  @override
  List<Object> get props => [message];
}
