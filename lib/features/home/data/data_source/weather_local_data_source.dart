import 'package:hive_ce_flutter/hive_ce_flutter.dart';

import '../models/weather_model/weather_model.dart';

class WeatherLocalDataSource {
  static const _boxName = 'weather_cache';
  static const _cacheKey = 'weatherCache';

  Future<Box<Map>> get _box async => await Hive.openBox<Map>(_boxName);

  Future<void> saveWeather(WeatherModel weather) async {
    final box = await _box;
    await box.put(_cacheKey, weather.toJson());
  }

  Future<WeatherModel?> getWeather() async {
    final box = await _box;
    final data = box.get(_cacheKey);
    if (data == null) return null;
    return WeatherModel.fromJson(data.cast<String, dynamic>());
  }

  Future<void> deleteWeather() async {
    final box = await _box;
    await box.delete(_cacheKey);
  }
}
