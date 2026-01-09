import 'package:ecommerce/features/auth/data/models/login_request.dart';
import 'package:ecommerce/features/auth/data/models/register_request.dart';
import 'package:ecommerce/features/auth/data/repositories/auth_repository.dart';
import 'package:ecommerce/features/auth/presentation/cubit/auth_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final _authRepository = AuthRepository();
  Future<void> register(RegisterRequest request) async {
    emit(RegisterLoading());
    try {
      await _authRepository.register(request);
      emit(RegisterSuccess());
    } catch (error) {
      // print(error.toString());
      emit(RegisterError(error.toString()));
    }
  }

  Future<void> login(LoginRequest request) async {
    emit(LoginLoading());
    try {
      await _authRepository.login(request);
      emit(LoginSuccess());
    } catch (error) {
      // print(error.toString());
      emit(LoginError(error.toString()));
    }
  }
}
