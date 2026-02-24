import 'dart:convert';

class Usuario {
  String nome;
  String email;
  Usuario({
    this.nome,
    this.email,
  });
  

  Usuario copyWith({
    String nome,
    String email,
  }) {
    return Usuario(
      nome: nome ?? this.nome,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'email': email,
    };
  }

  factory Usuario.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Usuario(
      nome: map['nome'],
      email: map['email'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Usuario.fromJson(String source) => Usuario.fromMap(json.decode(source));

  @override
  String toString() => 'Usuario(nome: $nome, email: $email)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Usuario &&
      o.nome == nome &&
      o.email == email;
  }

  @override
  int get hashCode => nome.hashCode ^ email.hashCode;
}
