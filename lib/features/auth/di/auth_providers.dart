import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sample_app/core/network/dio_provider.dart';
import 'package:flutter_sample_app/features/auth/api/state/session_provider.dart';
import 'package:flutter_sample_app/features/auth/data/data_source/auth_remote.dart';
import 'package:flutter_sample_app/features/auth/data/repository/auth_repository_impl.dart';
import 'package:flutter_sample_app/features/auth/domain/repository/auth_repository.dart';
import 'package:flutter_sample_app/features/auth/domain/usecase/login_usecase.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final dio = ref.read(dioProvider);
  final remote = AuthRemoteDataSource(dio);
  return AuthRepositoryImpl(remote);
});

final loginUseCaseProvider = Provider(
  (ref) => LoginUseCase(
    ref.read(authRepositoryProvider),
    ref.read(sessionProvider.notifier),
  ),
);
