import 'dart:convert';

class Combo {
  int id;
  String descricao;
  Combo({
    this.id,
    this.descricao,
  });

  Combo copyWith({
    int id,
    String descricao,
  }) {
    return Combo(
      id: id ?? this.id,
      descricao: descricao ?? this.descricao,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'descricao': descricao,
    };
  }

  factory Combo.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Combo(
      id: map['id'],
      descricao: map['descricao'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Combo.fromJson(String source) => Combo.fromMap(json.decode(source));

  @override
  String toString() => 'Combo(id: $id, descricao: $descricao)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Combo &&
      o.id == id &&
      o.descricao == descricao;
  }

  @override
  int get hashCode => id.hashCode ^ descricao.hashCode;

  static List<Combo> fromMapList(List list) {
    return list.isEmpty ? [] : list.map((e) => Combo.fromMap(e)).toList();
  }

}
