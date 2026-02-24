import 'package:get/get.dart';
import 'package:sme_prefeitura_sao_paulo_app/data/repository/monitoramento.repository.dart';
import 'package:sme_prefeitura_sao_paulo_app/modules/home/unidade_escolar/turno/ambiente-geral/ambiente.controller.dart';

class AmbienteBinding implements Bindings {
  @override
  dependencies() {
    Get.lazyPut<AmbienteController>(() => AmbienteController(
      monitoramentoRepository: MonitoramentoRepository()
    ));
  }
}