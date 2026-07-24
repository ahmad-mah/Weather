import '../../../../core/error/api_exception.dart';
import '../../../../core/services/api_service.dart';
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
        await apiService.get(endpoint: 'current.json', q: '$position');

    // WeatherAPI returns HTTP 200 with error body for invalid locations
    if (response.containsKey('error')) {
      throw ApiException(response['error']['message']);
    }

    return WeatherModel.fromJson(response);
  }
}
