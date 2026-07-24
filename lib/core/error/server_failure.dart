import 'package:dio/dio.dart';

import 'failure.dart';

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
          'Connection timeout. Please check your internet connection.',
        );
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout. Please try again later.');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout. Please try again later.');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          e.response!.statusCode!,
          e.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure('Request cancelled');
      case DioExceptionType.transformTimeout:
        return ServerFailure('Transform timeout. Please try again later.');
      case DioExceptionType.connectionError:
        return ServerFailure(
          'Connection error. Please check your internet connection.',
        );
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad certificate. Please contact support.');
      case DioExceptionType.unknown:
        return ServerFailure('Other error');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    switch (statusCode) {
      case 404:
        return ServerFailure('Your request was not found, please try later');
      case 500:
        return ServerFailure(
          'There is a problem with server, please try later',
        );
      case 400:
      case 401:
      case 403:
        return ServerFailure(response['error']['message']);
      default:
        return ServerFailure(
          'Something went wrong. Status code: $statusCode, Response: $response',
        );
    }
  }
}
