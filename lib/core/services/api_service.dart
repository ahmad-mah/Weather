import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {
  ApiService(this._dio);
  final Dio _dio;

  Future<Map<String, dynamic>> get({
    required String endpoint,
    dynamic q,
  }) async {
    final baseUrl = dotenv.get('API_BASE_URL');
    final apiKey = dotenv.get('API_KEY');
    final response = await _dio.get('$baseUrl/$endpoint?key=$apiKey&q=$q');
    return response.data;
  }
}
