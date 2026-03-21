import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sample_app/config/router/public_routes.dart';
import 'package:flutter_sample_app/core/auth/auth_provider.dart';
import 'package:flutter_sample_app/features/auth/presentation/routes/auth_routes.dart';
import 'package:flutter_sample_app/features/home/presentation/routes/home_routes.dart';
import 'package:go_router/go_router.dart';

final appRouterProvider = Provider((ref) {
  final authState = ref.watch(authStateProvider);
  final routes = [
    ...authRoutes,
    ...homeRoutes,
  ];

  return GoRouter(
    initialLocation: '/home',
    redirect: (context, state) {
      final isLoggedIn = authState.isAuthenticated;
      final isPublic = publicRouteNames.contains(state.name);

      if (!isLoggedIn && !isPublic) {
        return '/login';
      }

      if (isLoggedIn && state.name == 'login') {
        return '/home';
      }

      return null;
    },
    routes: routes,
  );
});
