import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sample_app/features/auth/api/state/auth_notifier_provider.dart';

final loginProvider = NotifierProvider<LoginNotifier, LoginState>(
  () => LoginNotifier(),
);

class LoginNotifier extends Notifier<LoginState> {
  late final AuthNotifier _authNotifier;

  @override
  LoginState build() {
    _authNotifier = ref.read(authNotifierProvider.notifier);
    return LoginState.initial();
  }

  Future<void> login() async {
    await _authNotifier.login(
      state.email,
      state.password,
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

  LoginState({
    required this.email,
    required this.password,
  });

  factory LoginState.initial() => LoginState(
        email: '',
        password: '',
      );
}
