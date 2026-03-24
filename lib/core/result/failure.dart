sealed class Failure {
  final String message;
  const Failure(this.message);
}

class InvalidCredentialsFailure extends Failure {
  const InvalidCredentialsFailure()
      : super('Correo o contraseña incorrectos');
}

class NetworkFailure extends Failure {
  const NetworkFailure() : super('Sin conexión');
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure() : super('No autorizado');
}

class ServerFailure extends Failure {
  const ServerFailure() : super('Error de servidor');
}

class UnknownFailure extends Failure {
  const UnknownFailure() : super('Error desconocido');
}