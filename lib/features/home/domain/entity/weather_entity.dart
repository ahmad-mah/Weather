class WeatherEntity {
  final String cityName;
  final String country;
  final String region;
  final String weatherConditionIcon;
  final double temperature;
  final double windSpeed;
  final num humidity;
  final String weatherCondition;
  final double temperatureFeelsLike;
  final num pressure;
  final num uv;
  final String localTime;
  final String windDir;
  final num precipMm;
  final num cloud;
  final num visKm;
  final double gustKph;
  final double windchillC;
  final double heatindexC;
  final double dewpointC;
  final num willItRain;
  final num chanceOfRain;
  final num willItSnow;
  final num chanceOfSnow;

  WeatherEntity({
    required this.cityName,
    required this.temperature,
    required this.windSpeed,
    required this.humidity,
    required this.weatherCondition,
    required this.weatherConditionIcon,
    required this.temperatureFeelsLike,
    required this.pressure,
    required this.uv,
    required this.localTime,
    required this.country,
    required this.region,
    required this.windDir,
    required this.precipMm,
    required this.cloud,
    required this.visKm,
    required this.gustKph,
    required this.windchillC,
    required this.heatindexC,
    required this.dewpointC,
    required this.willItRain,
    required this.chanceOfRain,
    required this.willItSnow,
    required this.chanceOfSnow,
  });

  factory WeatherEntity.fake() => WeatherEntity(
        cityName: 'City Name',
        country: '',
        region: '',
        weatherConditionIcon: '',
        temperature: 0,
        windSpeed: 0,
        humidity: 0,
        weatherCondition: 'Sunny',
        temperatureFeelsLike: 0,
        pressure: 0,
        uv: 0,
        localTime: '2024-01-01 12:00',
        windDir: 'N',
        precipMm: 0,
        cloud: 0,
        visKm: 0,
        gustKph: 0,
        windchillC: 0,
        heatindexC: 0,
        dewpointC: 0,
        willItRain: 0,
        chanceOfRain: 0,
        willItSnow: 0,
        chanceOfSnow: 0,
      );

  String get formattedDay {
    final dt = DateTime.parse(localTime);
    return [
      'Sunday', 'Monday', 'Tuesday', 'Wednesday',
      'Thursday', 'Friday', 'Saturday',
    ][dt.weekday % 7];
  }

  String get formattedTime => localTime.split(' ')[1];
}

