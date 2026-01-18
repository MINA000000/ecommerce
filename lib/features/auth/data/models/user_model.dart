// better than extends (extention in folder mappers) , because extends make the userModel continue as a type in presentation layer
class UserModel {
  final String name;
  final String email;
  final String role;
  UserModel({required this.name, required this.email, required this.role});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json["name"],
      email: json["email"],
      role: json["role"],
    );
  }
}

//another way to do that

// class UserModel extends User {
//   UserModel({required super.name, required super.email, required super.role});

//   factory UserModel.fromJson(Map<String, dynamic> json) {
//     return UserModel(
//       name: json["name"],
//       email: json["email"],
//       role: json["role"],
//     );
//   }
// }
