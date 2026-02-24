import 'dart:convert';

class Periodicidade {

  String codigo;
  String descricao;
  Periodicidade({
    this.codigo,
    this.descricao,
  });


  Periodicidade copyWith({
    String codigo,
    String descricao,
  }) {
    return Periodicidade(
      codigo: codigo ?? this.codigo,
      descricao: descricao ?? this.descricao,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'codigo': codigo,
      'descricao': descricao,
    };
  }

  factory Periodicidade.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Periodicidade(
      codigo: map['codigo'],
      descricao: map['descricao'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Periodicidade.fromJson(String source) => Periodicidade.fromMap(json.decode(source));

  @override
  String toString() => 'Periodicidade(codigo: $codigo, descricao: $descricao)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Periodicidade &&
      o.codigo == codigo &&
      o.descricao == descricao;
  }

  @override
  int get hashCode => codigo.hashCode ^ descricao.hashCode;
}
