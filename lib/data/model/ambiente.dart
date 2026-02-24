import 'dart:convert';

class Ambiente {
  int idAmbienteGeral;
  String descricao;
  String tipo;
  String total;
  String hash;
  Ambiente({
    this.idAmbienteGeral,
    this.descricao,
    this.tipo,
    this.total,
    this.hash,
  });

  Ambiente copyWith({
    int idAmbienteGeral,
    String descricao,
    String tipo,
    String total,
    String hash,
  }) {
    return Ambiente(
      idAmbienteGeral: idAmbienteGeral ?? this.idAmbienteGeral,
      descricao: descricao ?? this.descricao,
      tipo: tipo ?? this.tipo,
      total: total ?? this.total,
      hash: hash ?? this.hash,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idAmbienteGeral': idAmbienteGeral,
      'descricao': descricao,
      'tipo': tipo,
      'total': total,
      'hash': hash,
    };
  }

  factory Ambiente.fromMap(Map<String, dynamic> map) {
    return Ambiente(
      idAmbienteGeral: map['idAmbienteGeral'],
      descricao: map['descricao'],
      tipo: map['tipo'],
      total: map['total'],
      hash: map['hash'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Ambiente.fromJson(String source) => Ambiente.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Ambiente(idAmbienteGeral: $idAmbienteGeral, descricao: $descricao, tipo: $tipo, total: $total, hash: $hash)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Ambiente &&
      other.idAmbienteGeral == idAmbienteGeral &&
      other.descricao == descricao &&
      other.tipo == tipo &&
      other.total == total &&
      other.hash == hash;
  }

  @override
  int get hashCode {
    return idAmbienteGeral.hashCode ^
      descricao.hashCode ^
      tipo.hashCode ^
      total.hashCode ^
      hash.hashCode;
  }

  static List<Ambiente> fromMapList(List list) {
    return list.isEmpty ? [] : list.map((e) => Ambiente.fromMap(e)).toList();
  }
}
