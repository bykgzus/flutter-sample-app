import 'package:flutter_sample_app/features/auth/domain/entity/user.dart';

abstract class AuthRepository {
  Future<User> login(String email, String password);
}