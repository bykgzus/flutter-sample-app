import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sample_app/features/auth/data/data_source/auth_remote.dart';
import 'package:flutter_sample_app/features/auth/data/repository/auth_repository_impl.dart';
import 'package:flutter_sample_app/features/auth/domain/repository/auth_repository.dart';
import 'package:flutter_sample_app/features/auth/domain/usecase/login_usecase.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final remote = AuthRemoteDataSource();
  return AuthRepositoryImpl(remote);
});

final loginUseCaseProvider = Provider(
  (ref) => LoginUseCase(ref.read(authRepositoryProvider)),
);
