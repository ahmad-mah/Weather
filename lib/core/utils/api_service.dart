import 'package:dio/dio.dart';

class ApiService {
  static const String baseUrl = 'http://api.weatherapi.com/v1';
  static const String apiKey = '95fe712e7f564d2ab8752327251902';

  final Dio _dio;
  ApiService(this._dio);
  Future<Map<String, dynamic>> get(
      {required String endpoint, dynamic q}) async {
    final response = await _dio.get('$baseUrl/$endpoint?key=$apiKey&q=$q');
    return response.data;
  }
}
