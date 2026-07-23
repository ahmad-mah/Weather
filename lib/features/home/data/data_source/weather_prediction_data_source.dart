import 'package:dio/dio.dart';

abstract class WeatherPredictionDataSource {
  Future<int> getWeatherPrediction(List<int> features);
}

class WeatherPredictionDataSourceImpl implements WeatherPredictionDataSource {
  final Dio dio;

  WeatherPredictionDataSourceImpl(this.dio);

  @override
  Future<int> getWeatherPrediction(List<int> features) async {
    final url = 'http://10.0.2.2:5001/predict';

    final response = await dio.post(
      url,
      options: Options(headers: {'Content-Type': 'application/json'}),
      data: {'features': features},
    );

    return response.data['prediction'][0];
  }
}
