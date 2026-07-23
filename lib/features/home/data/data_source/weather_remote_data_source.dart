import '../../../../core/utils/api_service.dart';
import '../models/weather_model/weather_model.dart';

abstract class WeatherRemoteDataSource {
  Future<WeatherModel> getWeather(dynamic position);
}

class WeatherRemoteDataSourceImpl implements WeatherRemoteDataSource {
  final ApiService apiService;

  WeatherRemoteDataSourceImpl(this.apiService);

  @override
  Future<WeatherModel> getWeather(dynamic position) async {
    final response =
        await apiService.get(endpoint: 'forecast.json', q: '$position&days=7');

    return WeatherModel.fromJson(response);
  }
}
