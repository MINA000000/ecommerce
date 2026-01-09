import 'package:ecommerce/features/auth/data/models/user_model.dart';

class LoginResponse {
  LoginResponse({
    required this.message,
    required this.user,
    required this.token,
  });

  final String message;
  final UserModel user;
  final String token;

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      message: json["message"],
      user: UserModel.fromJson(json["user"]),
      token: json["token"],
    );
  }
}
