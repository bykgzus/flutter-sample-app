import 'package:flutter_sample_app/features/auth/domain/entity/user.dart';
import 'package:flutter_sample_app/features/auth/domain/repository/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<User> call(String email, String password) {
    return repository.login(email, password);
  }
}
