import 'package:get/get.dart';
import 'package:sme_prefeitura_sao_paulo_app/data/repository/monitoramento.repository.dart';
import 'package:sme_prefeitura_sao_paulo_app/modules/home/unidade_escolar/turno/turno.controller.dart';

class TurnoBinding implements Bindings {
  @override
  dependencies() {
    Get.lazyPut<TurnoController>(() => TurnoController(
      monitoramentoRepository: MonitoramentoRepository()
    ));
  }
}