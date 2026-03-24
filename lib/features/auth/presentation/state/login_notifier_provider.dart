import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sample_app/features/auth/di/auth_providers.dart';
import 'package:flutter_sample_app/features/auth/domain/usecase/login_usecase.dart';
import 'package:flutter_sample_app/features/auth/presentation/state/login_error.dart';

final loginProvider = NotifierProvider<LoginNotifier, LoginState>(
  () => LoginNotifier(),
);

class LoginNotifier extends Notifier<LoginState> {
  late final LoginUseCase _loginUseCase;

  @override
  LoginState build() {
    _loginUseCase = ref.read(loginUseCaseProvider);
    return LoginState.initial();
  }

  Future<void> login() async {
    state = state.copyWith(isLoading: true, error: null);

    final result = await _loginUseCase(state.email, state.password);

    state = result.when(
      success: (_) {
        return state.copyWith(isLoading: false, error: null);
      },
      error: (failure) {
        return state.copyWith(isLoading: false, error: mapFailure(failure));
      },
    );
  }

  void onEmailChanged(String email) {
    state = LoginState(email: email, password: state.password);
  }

  void onPasswordChanged(String password) {
    state = LoginState(email: state.email, password: password);
  }
}

class LoginState {
  final String email;
  final String password;
  final bool isLoading;
  final LoginError? error;

  LoginState({
    required this.email,
    required this.password,
    this.isLoading = false,
    this.error,
  });

  factory LoginState.initial() => LoginState(email: '', password: '');

  LoginState copyWith({
    String? email,
    String? password,
    bool? isLoading,
    LoginError? error,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}
