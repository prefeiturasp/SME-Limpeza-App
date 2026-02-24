import 'dart:convert';

class Turno {

  int idTurno;
  String codigo;
  String descricao;
  String total;
  Turno({
    this.idTurno,
    this.codigo,
    this.descricao,
    this.total,
  });

  Turno copyWith({
    int idTurno,
    String codigo,
    String descricao,
    String total,
  }) {
    return Turno(
      idTurno: idTurno ?? this.idTurno,
      codigo: codigo ?? this.codigo,
      descricao: descricao ?? this.descricao,
      total: total ?? this.total,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'idTurno': idTurno,
      'codigo': codigo,
      'descricao': descricao,
      'total': total,
    };
  }

  factory Turno.fromMap(Map<String, dynamic> map) {
    return Turno(
      idTurno: map['idTurno'],
      codigo: map['codigo'],
      descricao: map['descricao'],
      total: map['total'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Turno.fromJson(String source) => Turno.fromMap(json.decode(source));

  static List<Turno> fromMapList(List list) {
    return list.isEmpty ? [] : list.map((e) => Turno.fromMap(e)).toList();
  }

  @override
  String toString() {
    return 'Turno(idTurno: $idTurno, codigo: $codigo, descricao: $descricao, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Turno &&
      other.idTurno == idTurno &&
      other.codigo == codigo &&
      other.descricao == descricao &&
      other.total == total;
  }

  @override
  int get hashCode {
    return idTurno.hashCode ^
      codigo.hashCode ^
      descricao.hashCode ^
      total.hashCode;
  }

  
}
