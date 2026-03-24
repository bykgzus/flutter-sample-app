import 'package:dio/dio.dart';
import 'package:flutter_sample_app/features/auth/data/model/user_model.dart';

class AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSource(this.dio);

  Future<UserModel> login(String email, String password) async {
    // Simulación de una llamada a una API REST para autenticar al usuario
    
    final response = await dio.post(
      '/login',
      data: {
        'email': email,
        'password': password,
      },
    );
    
    return UserModel.fromJson(response.data);
  }
}
