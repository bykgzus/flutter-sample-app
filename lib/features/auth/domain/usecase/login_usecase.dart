import 'package:flutter_sample_app/core/result/result.dart';
import 'package:flutter_sample_app/features/auth/api/state/session_provider.dart';
import 'package:flutter_sample_app/features/auth/domain/repository/auth_repository.dart';

class LoginUseCase {
  final AuthRepository _repository;
  final SessionHandlerNotifier _sessionNotifier;

  LoginUseCase(this._repository, this._sessionNotifier);

  Future<Result> call(String email, String password) async {
    final result = await _repository.login(email, password);

    return result.when(
      success: (user) {
        _sessionNotifier.setSession(user);
        return Success(user);
      },
      error: (e) => Error(e),
    );
  }
}
