import 'package:dio/dio.dart';
import 'package:flutter_sample_app/core/result/failure.dart';

Failure mapException(Object e) {
  if (e is DioException) {
    switch (e.type) {
      case DioExceptionType.connectionError:
      case DioExceptionType.connectionTimeout:
        return const NetworkFailure();

      case DioExceptionType.badResponse:
        if (e.response?.statusCode == 401) {
          return const UnauthorizedFailure();
        }
        return const ServerFailure();

      default:
        return const UnknownFailure();
    }
  }

  return const UnknownFailure();
}
