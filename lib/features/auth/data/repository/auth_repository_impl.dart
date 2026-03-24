import 'package:flutter_sample_app/core/network/dio_exception_mapper.dart';
import 'package:flutter_sample_app/core/result/result.dart';
import 'package:flutter_sample_app/features/auth/data/data_source/auth_remote.dart';
import 'package:flutter_sample_app/features/auth/domain/entity/user.dart';
import 'package:flutter_sample_app/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;

  AuthRepositoryImpl(this.remote);

  @override
  Future<Result<User>> login(String email, String password) async {
    try {
      final model = await remote.login(email, password);
      return Success(model);
    } catch (e) {
      return Error(mapException(e));
    }
  }
}
