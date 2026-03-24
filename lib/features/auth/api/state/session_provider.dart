import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sample_app/features/auth/domain/entity/user.dart';

final sessionProvider = NotifierProvider<SessionHandlerNotifier, SessionState>(
  SessionHandlerNotifier.new,
);

class SessionHandlerNotifier extends Notifier<SessionState>
    implements Listenable {
  final _listeners = <VoidCallback>[];

  @override
  SessionState build() => const SessionState.unauthenticated();

  void setSession(User user) {
    state = SessionState.authenticated(user);
    _notify();
  }

  void clearSession() {
    state = const SessionState.unauthenticated();
    _notify();
  }

  @override
  void addListener(VoidCallback listener) {
    _listeners.add(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    _listeners.remove(listener);
  }

  void _notify() {
    for (final l in _listeners) {
      l();
    }
  }
}

class SessionState {
  final bool isAuthenticated;
  final User? user;

  const SessionState({required this.isAuthenticated, this.user});

  const SessionState.unauthenticated() : isAuthenticated = false, user = null;

  const SessionState.authenticated(User this.user) : isAuthenticated = true;
}
