import 'dart:convert';

class UnidadeEscolar {

  int id;
  String codigo;
  String descricao;
  String endereco;
  UnidadeEscolar({
    this.id,
    this.codigo,
    this.descricao,
    this.endereco,
  });


  UnidadeEscolar copyWith({
    int id,
    String codigo,
    String descricao,
    String endereco,
  }) {
    return UnidadeEscolar(
      id: id ?? this.id,
      codigo: codigo ?? this.codigo,
      descricao: descricao ?? this.descricao,
      endereco: endereco ?? this.endereco,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'codigo': codigo,
      'descricao': descricao,
      'endereco': endereco,
    };
  }

  factory UnidadeEscolar.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return UnidadeEscolar(
      id: map['id'],
      codigo: map['codigo'],
      descricao: map['descricao'],
      endereco: map['endereco'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UnidadeEscolar.fromJson(String source) => UnidadeEscolar.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UnidadeEscolar(id: $id, codigo: $codigo, descricao: $descricao, endereco: $endereco)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is UnidadeEscolar &&
      o.id == id &&
      o.codigo == codigo &&
      o.descricao == descricao &&
      o.endereco == endereco;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      codigo.hashCode ^
      descricao.hashCode ^
      endereco.hashCode;
  }

  static List<UnidadeEscolar> fromMapList(List list) {
    return list.isEmpty ? [] : list.map((e) => UnidadeEscolar.fromMap(e)).toList();
  }
}
