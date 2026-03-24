import 'package:flutter_sample_app/core/result/failure.dart';

enum LoginError {
  invalidCredentials,
  network,
  server,
}

LoginError? mapFailure(Failure f) {
  return switch (f) {
    InvalidCredentialsFailure() => LoginError.invalidCredentials,
    NetworkFailure() => LoginError.network,
    ServerFailure() => LoginError.server,
    _ => LoginError.server,
  };
}