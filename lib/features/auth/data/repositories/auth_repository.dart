import 'package:ecommerce/features/auth/data/data_sources/local/auth_shared_pref_local_data_source.dart';
import 'package:ecommerce/features/auth/data/data_sources/remote/auth_api_remote_data_source.dart';
import 'package:ecommerce/features/auth/data/models/login_request.dart';
import 'package:ecommerce/features/auth/data/models/register_request.dart';
import 'package:ecommerce/features/auth/data/models/user_model.dart';

class AuthRepository {
  final _authRemoteDataSource = AuthApiRemoteDataSource();
  final _authLocalDataSource = AuthSharedPrefLocalDataSource();
  Future<UserModel> register(RegisterRequest request) async {
    final response = await _authRemoteDataSource.register(request);
    await _authLocalDataSource.saveToken(response.token);
    return response.user;
  }

  Future<UserModel> login(LoginRequest request) async {
    final response = await _authRemoteDataSource.login(request);
    await _authLocalDataSource.saveToken(response.token);
    return response.user;
  }
}
