import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sample_app/features/auth/presentation/state/login_notifier_provider.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(loginProvider.notifier);

    return Column(
      children: [
        TextField(onChanged: notifier.onEmailChanged),
        ElevatedButton(
          onPressed: () => notifier.login(),
          child: Text('Login'),
        )
      ],
    );
  }
}
