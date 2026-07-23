import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';

import 'failure.dart';

class ErrorHandler extends Failure {
  ErrorHandler(super.message);

  factory ErrorHandler.fromException(dynamic error) {
    String message = _handleError(error);
    return ErrorHandler(message);
  }

  static String _handleError(dynamic error) {
    if (error is PlatformException) {
      return _handlePlatformException(error);
    } else if (error is TimeoutException) {
      return _handleTimeoutException(error);
    } else if (error is HttpException) {
      return _handleHttpException(error);
    } else if (error is FormatException) {
      return _handleFormatException(error);
    } else if (error is SocketException) {
      return "No internet connection. Please check your network.";
    } else if (error is MissingPluginException) {
      return "A required plugin is missing. Please ensure all dependencies are properly configured.";
    } else if (error is UnimplementedError) {
      return "This feature is not implemented on the current platform.";
    } else if (error is AssertionError) {
      return "An assertion error occurred. Please report this issue.";
    } else if (error is RangeError) {
      return "A value is out of range.";
    } else if (error is TypeError) {
      return "A type conversion error occurred.";
    } else if (error is StateError) {
      return "Invalid state operation attempted.";
    } else if (error is ArgumentError) {
      return "Invalid argument provided to an operation.";
    } else if (error is UnsupportedError) {
      return "An unsupported operation was attempted.";
    } else if (error is ConcurrentModificationError) {
      return "Collection was modified during iteration.";
    } else if (error is Exception) {
      return _handleGenericException(error);
    } else if (error is String) {
      return error;
    }

    return "An unknown error occurred: $error";
  }

  static String _handlePlatformException(PlatformException error) {
    switch (error.code) {
      case "ERROR_ALREADY_IN_USE":
        return "The resource is already in use.";
      case "ERROR_MISSING_PLUGIN":
        return "A required plugin is missing. Check your platform dependencies.";
      case "ERROR_NETWORK_REQUEST_FAILED":
        return "A network error occurred. Please check your internet connection.";
      case 'network_error':
        return 'Network error occurred';
      default:
        return "An unexpected platform error occurred.";
    }
  }

  static String _handleTimeoutException(TimeoutException error) {
    return "The connection has timed out. Please try again.";
  }

  static String _handleHttpException(HttpException error) {
    return "Failed to connect to the server.";
  }

  static String _handleFormatException(FormatException error) {
    return "Invalid data format received.";
  }

  static String _handleGenericException(Exception error) {
    return "An unexpected error occurred: ${error.toString()}";
  }
}
