import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sample_app/config/router/public_routes.dart';
import 'package:flutter_sample_app/features/auth/api/state/session_provider.dart';
import 'package:flutter_sample_app/features/auth/presentation/routes/auth_routes.dart';
import 'package:flutter_sample_app/features/home/presentation/routes/home_routes.dart';
import 'package:go_router/go_router.dart';

final appRouterProvider = Provider((ref) {
  final authNotifier = ref.read(sessionProvider.notifier);
  final routes = [...authRoutes, ...homeRoutes];

  return GoRouter(
    initialLocation: '/home',
    refreshListenable: authNotifier,
    redirect: (context, state) {
      final session = ref.read(sessionProvider);
      final isLoggedIn = session.isAuthenticated;
      final isPublic = publicRoutes.contains(state.matchedLocation);

      if (!isLoggedIn && !isPublic) {
        return '/login';
      }

      if (isLoggedIn && state.matchedLocation == '/login') {
        return '/home';
      }

      return null;
    },
    routes: routes,
  );
});
