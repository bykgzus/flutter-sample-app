import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sample_app/features/auth/api/state/session_provider.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio(
    BaseOptions(baseUrl: 'https://api.tuapp.com'),
  );

  dio.interceptors.add(
    InterceptorsWrapper(
      onRequest: (options, handler) {
        final session = ref.read(sessionProvider);
        if (session.user?.token != null) {
          options.headers['Authorization'] = 'Bearer ${session.user!.token}';
        }
        handler.next(options);
      },
      onError: (e, handler) {
        if (e.response?.statusCode == 401) {
          ref.read(sessionProvider.notifier).clearSession();
        }
        handler.next(e);
      },
    ),
  );

  return dio;
});
