import 'package:flutter_sample_app/features/home/presentation/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

List<GoRoute> homeRoutes = [
  GoRoute(
    path: '/home',
    name: 'home',
    builder: (_, __) => HomeScreen(title: 'Flutter Demo Home Page'),
  ),
];
