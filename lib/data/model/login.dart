import 'dart:convert';

class Login {
  String cnpj;
  String senha;

  Login({
    this.cnpj,
    this.senha,
  });


  Login copyWith({
    String cnpj,
    String senha,
  }) {
    return Login(
      cnpj: cnpj ?? this.cnpj,
      senha: senha ?? this.senha,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cnpj': cnpj,
      'senha': senha,
    };
  }

  factory Login.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Login(
      cnpj: map['cnpj'],
      senha: map['senha'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Login.fromJson(String source) => Login.fromMap(json.decode(source));

  @override
  String toString() => 'Login(cnpj: $cnpj, senha: $senha)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Login &&
      o.cnpj == cnpj &&
      o.senha == senha;
  }

  @override
  int get hashCode => cnpj.hashCode ^ senha.hashCode;
}
