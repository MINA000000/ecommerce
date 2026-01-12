import 'package:ecommerce/features/auth/domain/entities/user.dart';

class UserModel extends User {
  UserModel({required super.name, required super.email, required super.role});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json["name"],
      email: json["email"],
      role: json["role"],
    );
  }
}
