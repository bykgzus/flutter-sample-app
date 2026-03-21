import 'package:flutter_sample_app/features/auth/data/data_source/auth_remote.dart';
import 'package:flutter_sample_app/features/auth/domain/entity/user.dart';
import 'package:flutter_sample_app/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;

  AuthRepositoryImpl(this.remote);

  @override
  Future<User> login(String email, String password) {
    return remote.login(email, password);
  }
}
