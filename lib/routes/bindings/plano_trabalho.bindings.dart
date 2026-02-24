import 'package:get/get.dart';
import 'package:sme_prefeitura_sao_paulo_app/data/repository/monitoramento.repository.dart';
import 'package:sme_prefeitura_sao_paulo_app/modules/home/unidade_escolar/turno/ambiente-geral/monitoramento/plano_trabalho/plano_trabalho.controller.dart';

class PlanoTrabalhoBinding implements Bindings {
  @override
  dependencies() {
    Get.lazyPut<PlanoTrabalhoController>(() => PlanoTrabalhoController(
      monitoramentoRepository: MonitoramentoRepository(),
    ));
  }
}