import 'package:flutter_sample_app/features/auth/data/model/user_model.dart';

class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password) async {
    // HTTP call
    return UserModel(id: '123', email: email);
  }
}
