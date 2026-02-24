import 'dart:convert';

import 'package:sme_prefeitura_sao_paulo_app/data/model/ambiente.dart';
import 'package:sme_prefeitura_sao_paulo_app/data/model/periodicidade.dart';
import 'package:sme_prefeitura_sao_paulo_app/data/model/turno.dart';
import 'package:sme_prefeitura_sao_paulo_app/utils/date.utils.dart';
import 'package:sme_prefeitura_sao_paulo_app/utils/utils.dart';

class Monitoramento {
  int id;
  String atividades;
  Ambiente ambiente;
  DateTime data;
  bool flagRealizado;
  DateTime dataHoraInicio;
  double latitudeInicio;
  double longitudeInicio;
  DateTime dataHoraTermino;
  double latitudeTermino;
  double longitudeTermino;
  Periodicidade periodicidade;
  Turno turno;
  Monitoramento({
    this.id,
    this.atividades,
    this.ambiente,
    this.data,
    this.flagRealizado,
    this.dataHoraInicio,
    this.latitudeInicio,
    this.longitudeInicio,
    this.dataHoraTermino,
    this.latitudeTermino,
    this.longitudeTermino,
    this.periodicidade,
    this.turno,
  });

  Monitoramento copyWith({
    int id,
    String atividades,
    Ambiente ambiente,
    DateTime data,
    bool flagRealizado,
    DateTime dataHoraInicio,
    double latitudeInicio,
    double longitudeInicio,
    DateTime dataHoraTermino,
    double latitudeTermino,
    double longitudeTermino,
    Periodicidade periodicidade,
    Turno turno,
  }) {
    return Monitoramento(
      id: id ?? this.id,
      atividades: atividades ?? this.atividades,
      ambiente: ambiente ?? this.ambiente,
      data: data ?? this.data,
      flagRealizado: flagRealizado ?? this.flagRealizado,
      dataHoraInicio: dataHoraInicio ?? this.dataHoraInicio,
      latitudeInicio: latitudeInicio ?? this.latitudeInicio,
      longitudeInicio: longitudeInicio ?? this.longitudeInicio,
      dataHoraTermino: dataHoraTermino ?? this.dataHoraTermino,
      latitudeTermino: latitudeTermino ?? this.latitudeTermino,
      longitudeTermino: longitudeTermino ?? this.longitudeTermino,
      periodicidade: periodicidade ?? this.periodicidade,
      turno: turno ?? this.turno,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'atividades': atividades,
      'ambiente': ambiente?.toMap(),
      'data': DateUtils.dateTimeToString(data),
      'flagRealizado': flagRealizado,
      'dataHoraInicio': DateUtils.dateTimeToString(dataHoraInicio),
      'latitudeInicio': latitudeInicio,
      'longitudeInicio': longitudeInicio,
      'dataHoraTermino': DateUtils.dateTimeToString(dataHoraTermino),
      'latitudeTermino': latitudeTermino,
      'longitudeTermino': longitudeTermino,
      'periodicidade': periodicidade?.toMap(),
      'turno': turno?.toMap(),
    };
  }

  factory Monitoramento.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Monitoramento(
      id: map['id'],
      atividades: map['atividades'],
      ambiente: Ambiente.fromMap(map['ambiente']),
      data: DateUtils.stringToDateTime(map['data']),
      flagRealizado: map['flagRealizado'],
      dataHoraInicio: DateUtils.stringToDateTime(map['dataHoraInicio']),
      latitudeInicio: Utils.toDouble(map['latitudeInicio']),
      longitudeInicio: Utils.toDouble(map['longitudeInicio']),
      dataHoraTermino: DateUtils.stringToDateTime(map['dataHoraTermino']),
      latitudeTermino: Utils.toDouble(map['latitudeTermino']),
      longitudeTermino: Utils.toDouble(map['longitudeTermino']),
      periodicidade: Periodicidade.fromMap(map['periodicidade']),
      turno: Turno.fromMap(map['turno']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Monitoramento.fromJson(String source) => Monitoramento.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Monitoramento(id: $id, atividades: $atividades, ambiente: $ambiente, data: $data, flagRealizado: $flagRealizado, dataHoraInicio: $dataHoraInicio, latitudeInicio: $latitudeInicio, longitudeInicio: $longitudeInicio, dataHoraTermino: $dataHoraTermino, latitudeTermino: $latitudeTermino, longitudeTermino: $longitudeTermino, periodicidade: $periodicidade, turno: $turno)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Monitoramento &&
      o.id == id &&
      o.atividades == atividades &&
      o.ambiente == ambiente &&
      o.data == data &&
      o.flagRealizado == flagRealizado &&
      o.dataHoraInicio == dataHoraInicio &&
      o.latitudeInicio == latitudeInicio &&
      o.longitudeInicio == longitudeInicio &&
      o.dataHoraTermino == dataHoraTermino &&
      o.latitudeTermino == latitudeTermino &&
      o.longitudeTermino == longitudeTermino &&
      o.periodicidade == periodicidade &&
      o.turno == turno;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      atividades.hashCode ^
      ambiente.hashCode ^
      data.hashCode ^
      flagRealizado.hashCode ^
      dataHoraInicio.hashCode ^
      latitudeInicio.hashCode ^
      longitudeInicio.hashCode ^
      dataHoraTermino.hashCode ^
      latitudeTermino.hashCode ^
      longitudeTermino.hashCode ^
      periodicidade.hashCode ^
      turno.hashCode;
  }

  static Monitoramento fromMapFunction(Map<String, dynamic> m) {
    return m == null ? null : Monitoramento.fromMap(m);
  }

  static List<Monitoramento> fromMapList(List list) {
    return list.isEmpty ? [] : list.map((e) => Monitoramento.fromMap(e)).toList();
  }
}
