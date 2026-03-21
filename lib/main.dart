import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sample_app/config/router/router.dart';
import 'package:flutter_sample_app/config/theme.dart';
import 'package:flutter_sample_app/core/auth/auth_provider.dart';
import 'package:flutter_sample_app/features/auth/api/state/auth_notifier_provider.dart';

void main() {
  runApp(
    ProviderScope(
      overrides: [
        authStateProvider.overrideWith((ref) {
          return ref.watch(authNotifierProvider);
        }),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);

    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: appTheme,
      routerConfig: router,
    );
  }
}
