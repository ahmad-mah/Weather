import '../../../domain/entity/weather_entity.dart';
import 'current.dart';
import 'location.dart';

class WeatherModel extends WeatherEntity {

  WeatherModel({this.location, this.current, DateTime? cachedAt})
    : cachedAt = cachedAt ?? DateTime.now(),
      super(
        cityName: location!.name!,
        temperature: current!.tempC!,
        windSpeed: current.windKph!,
        humidity: current.humidity!,
        weatherCondition: current.condition!.text!,
        weatherConditionIcon: 'https:${current.condition!.icon!}',
        temperatureFeelsLike: current.feelslikeC!,
        pressure: current.pressureMb!,
        uv: current.uv!,
        localTime: location.localtime!,
        country: location.country!,
        region: location.region!,
        windDir: current.windDir!,
        precipMm: current.precipMm!,
        cloud: current.cloud!,
        visKm: current.visKm!,
        gustKph: current.gustKph!,
        windchillC: current.windchillC!,
        heatindexC: current.heatindexC!,
        dewpointC: current.dewpointC!,
        willItRain: current.willItRain!,
        chanceOfRain: current.chanceOfRain!,
        willItSnow: current.willItSnow!,
        chanceOfSnow: current.chanceOfSnow!,
      );

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
    location: json['location'] == null
        ? null
        : Location.fromJson((json['location'] as Map).cast<String, dynamic>()),
    current: json['current'] == null
        ? null
        : Current.fromJson((json['current'] as Map).cast<String, dynamic>()),
    cachedAt: json['cachedAt'] != null
        ? DateTime.parse(json['cachedAt'] as String)
        : null,
  );
  Location? location;
  Current? current;
  DateTime cachedAt;

  Map<String, dynamic> toJson() => {
    'location': location?.toJson(),
    'current': current?.toJson(),
    'cachedAt': cachedAt.toIso8601String(),
  };
}
