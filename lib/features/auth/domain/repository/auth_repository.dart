import 'package:flutter_sample_app/core/result/result.dart';
import 'package:flutter_sample_app/features/auth/domain/entity/user.dart';

abstract class AuthRepository {
  Future<Result<User>> login(String email, String password);
}