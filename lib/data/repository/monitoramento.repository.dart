import 'package:sme_prefeitura_sao_paulo_app/data/model/ambiente.dart';
import 'package:sme_prefeitura_sao_paulo_app/data/model/monitoramento.dart';
import 'package:sme_prefeitura_sao_paulo_app/data/model/turno.dart';
import 'package:sme_prefeitura_sao_paulo_app/data/provider/api_back.provider.dart';

class MonitoramentoRepository {
  
  final String url = "/monitoramento";

  Future<List<Monitoramento>> buscarTodos() async {
    return Monitoramento.fromMapList(
      ApiBackProvider.checkResult(
        await ApiBackProvider.doGet("$url/buscar-todos")));
  }

  Future<List<Turno>> buscarTurnos() async {
    return Turno.fromMapList(
      ApiBackProvider.checkResult(
        await ApiBackProvider.doGet("$url/turno")));
  }

  Future<List<Ambiente>> buscarAmbientesPorTurno(int idTurno) async {
    return Ambiente.fromMapList(
      ApiBackProvider.checkResult(
        await ApiBackProvider.doGet("$url/turno/$idTurno/ambiente-geral")));
  }

  Future<List<Monitoramento>> buscarMonitoramentosPorTurnoEAmbiente(int idTurno, int idAmbiente) async {
    return Monitoramento.fromMapList(
      ApiBackProvider.checkResult(
        await ApiBackProvider.doGet("$url/turno/$idTurno/ambiente-geral/$idAmbiente")));
  }

  Future atualizar(Monitoramento m) async {
    return ApiBackProvider.checkResult(await ApiBackProvider.doPost("$url/atualizar/${m.id}", m.toJson()));
  }

}