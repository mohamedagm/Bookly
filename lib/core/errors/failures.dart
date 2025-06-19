import 'package:dio/dio.dart';

abstract class Failures {
  final String errMessage;

  Failures(this.errMessage);
}

class ServerFailure extends Failures {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioEXception(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection timeout with server.");
      case DioExceptionType.sendTimeout:
        return ServerFailure("Send timeout. Unable to send data to server.");
      case DioExceptionType.receiveTimeout:
        return ServerFailure(
          "Receive timeout. Server took too long to respond.",
        );
      case DioExceptionType.badCertificate:
        return ServerFailure("Invalid SSL certificate.");
      case DioExceptionType.badResponse:
        ServerFailure.fromDioResponse(
          dioException.response!.statusCode!,
          dioException.response!,
        );
      case DioExceptionType.cancel:
        return ServerFailure("Request was cancelled.");
      case DioExceptionType.connectionError:
        return ServerFailure(
          "Connection error. Please check your internet connection.",
        );
      case DioExceptionType.unknown:
        return ServerFailure("Unexpected error occurred. Please try again.");
    }
    return ServerFailure('Oops, Try again later we cant detect the error');
  }

  factory ServerFailure.fromDioResponse(int statusCode, dynamic response) {
    if (statusCode == 400) {
      return ServerFailure("Bad Request - 400");
    } else if (statusCode == 401) {
      return ServerFailure("Unauthorized - 401");
    } else if (statusCode == 404) {
      return ServerFailure("Not Found - 404");
    } else if (statusCode == 500) {
      return ServerFailure("Internal Server Error - 500");
    } else {
      return ServerFailure("Received invalid status code: $statusCode");
    }
  }
}
