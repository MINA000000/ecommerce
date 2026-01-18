class RegisterRequest {
  RegisterRequest({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
  });

  final String name;
  final String email;
  final String password;
  final String phone;

  Map<String, dynamic> toJson() => {
    "name": name,
    "email": email,
    "password": password,
    "rePassword": password,
    "phone": phone,
  };
}
