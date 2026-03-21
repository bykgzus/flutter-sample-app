import 'package:flutter_sample_app/features/auth/presentation/screens/login_screen.dart';
import 'package:go_router/go_router.dart';

List<GoRoute> authRoutes = [
  GoRoute(
    path: '/login',
    name: 'login',
    builder: (_, __) => LoginScreen()
  ),
];
