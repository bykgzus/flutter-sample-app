import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sample_app/core/auth/auth_provider.dart';

final homeProvider = NotifierProvider<HomeNotifier, HomeState>(
  () => HomeNotifier(),
);

class HomeNotifier extends Notifier<HomeState> {
  late final String? _userEmail;

  @override
  HomeState build() {
    _userEmail = ref.read(authStateProvider).user?.email;
    return HomeState.initial(_userEmail ?? 'Guest');
  }

  void increment() {
    state = state.copyWith(counter: state.counter + 1);
  }
}

class HomeState {
  final int counter;
  final String userEmail;

  HomeState(
    this.userEmail, {this.counter = 0}
  );

  HomeState copyWith({
    int? counter,
    String? userEmail,
  }) {
    return HomeState(
      userEmail ?? this.userEmail,
      counter: counter ?? this.counter,
    );
  }

  factory HomeState.initial(String email) => HomeState(
    email,
    counter: 0
  );
}
