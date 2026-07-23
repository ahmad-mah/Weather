import '../../../../../core/helpers/format_day.dart';
import '../../../domain/entity/weather_entity.dart';
import 'current.dart';
import 'forecast.dart';
import 'location.dart';

class WeatherModel extends WeatherEntity {
  Location? location;
  Current? current;
  Forecast? forecast;

  WeatherModel({this.location, this.current, this.forecast})
      : super(
          cityName: location!.name!,
          temperature: current!.tempC!,
          windSpeed: current.windMph!,
          humidity: current.humidity!,
          weatherCondition: current.condition!.text!,
          weatherConditionIcon: 'https:${current.condition!.icon!}',
          temperatureFeelsLike: current.feelslikeC!,
          pressure: current.pressureIn!,
          uv: current.uv!,
          localTime: location.localtime!,
          country: location.country!,
          region: location.region!,
          hourlyForecast: forecast!.forecastday![0].hour!
              .where((e) => forecast.forecastday![0].hour!.indexOf(e) % 3 == 0)
              .map(
                (e) => HourlyForecast(
                  time: e.time!.split(' ')[1],
                  temperature: e.tempC!,
                  iconUrl: 'https:${e.condition!.icon!}',
                ),
              )
              .toList(),
          weeklyForecast: forecast.forecastday!
              .map(
                (e) => DailyForecast(
                  day: formatDayShort(e.date!),
                  maxTemp: e.day!.maxtempC!,
                  minTemp: e.day!.mintempC!,
                  iconUrl: 'https:${e.day!.condition!.icon!}',
                  weatherCondition: e.day!.condition!.text!,
                ),
              )
              .toList(),
        );

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        location: json['location'] == null
            ? null
            : Location.fromJson(json['location'] as Map<String, dynamic>),
        current: json['current'] == null
            ? null
            : Current.fromJson(json['current'] as Map<String, dynamic>),
        forecast: json['forecast'] == null
            ? null
            : Forecast.fromJson(json['forecast'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'location': location?.toJson(),
        'current': current?.toJson(),
        'forecast': forecast?.toJson(),
      };
}
