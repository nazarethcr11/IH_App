class User {
  final String email;
  final String password;

  User({required this.email, required this.password});

  // Método para crear un usuario a partir de un mapa (por ejemplo, JSON)
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      password: json['password'],
      // Inicializar otros campos
    );
  }

  // Método para convertir el usuario a un mapa (por ejemplo, para guardar en SharedPreferences)
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      // Convertir otros campos
    };
  }
}