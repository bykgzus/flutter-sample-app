import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sample_app/features/auth/di/auth_providers.dart';
import 'package:flutter_sample_app/features/auth/domain/entity/user.dart';
import 'package:flutter_sample_app/features/auth/domain/usecase/login_usecase.dart';

final authNotifierProvider =
    NotifierProvider<AuthNotifier, AuthState>(AuthNotifier.new);

class AuthNotifier extends Notifier<AuthState> {
  late final LoginUseCase _loginUseCase;

  @override
  AuthState build() {
    _loginUseCase = ref.read(loginUseCaseProvider);
    return const AuthState(isAuthenticated: false);
  }

  Future<void> login(String email, String password) async {
    final user = await _loginUseCase(email, password);

    state = AuthState(
      isAuthenticated: true,
      user: user,
    );
  }

  void logout() {
    state = const AuthState(isAuthenticated: false, user: null);
  }
}

class AuthState {
  final bool isAuthenticated;
  final User? user;

  const AuthState({
    required this.isAuthenticated,
    this.user,
  });
}
