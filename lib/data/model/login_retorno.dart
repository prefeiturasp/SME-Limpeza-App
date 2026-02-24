import 'dart:convert';

import 'package:sme_prefeitura_sao_paulo_app/data/model/usuario.dart';

class LoginRetorno {
  Usuario prestadorServico; 
  String accessToken;
  LoginRetorno({
    this.prestadorServico,
    this.accessToken,
  });

  LoginRetorno copyWith({
    Usuario prestadorServico,
    String accessToken,
  }) {
    return LoginRetorno(
      prestadorServico: prestadorServico ?? this.prestadorServico,
      accessToken: accessToken ?? this.accessToken,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'prestadorServico': prestadorServico?.toMap(),
      'accessToken': accessToken,
    };
  }

  factory LoginRetorno.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return LoginRetorno(
      prestadorServico: Usuario.fromMap(map['prestadorServico']),
      accessToken: map['accessToken'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginRetorno.fromJson(String source) => LoginRetorno.fromMap(json.decode(source));

  @override
  String toString() => 'LoginRetorno(prestadorServico: $prestadorServico, accessToken: $accessToken)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is LoginRetorno &&
      o.prestadorServico == prestadorServico &&
      o.accessToken == accessToken;
  }

  @override
  int get hashCode => prestadorServico.hashCode ^ accessToken.hashCode;
}
