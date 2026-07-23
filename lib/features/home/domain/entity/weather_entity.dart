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
  final List<HourlyForecast> hourlyForecast;
  final List<DailyForecast> weeklyForecast;

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
    required this.hourlyForecast,
    required this.weeklyForecast,
  });
}

class HourlyForecast {
  final String time;
  final double temperature;
  final String iconUrl;

  HourlyForecast({
    required this.time,
    required this.temperature,
    required this.iconUrl,
  });
}

class DailyForecast {
  final String day;
  final double maxTemp;
  final double minTemp;
  final String iconUrl;
  final String weatherCondition;

  DailyForecast({
    required this.weatherCondition,
    required this.day,
    required this.maxTemp,
    required this.minTemp,
    required this.iconUrl,
  });
}

