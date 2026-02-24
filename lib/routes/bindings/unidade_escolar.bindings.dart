import 'package:get/get.dart';
import 'package:sme_prefeitura_sao_paulo_app/data/repository/monitoramento.repository.dart';
import 'package:sme_prefeitura_sao_paulo_app/modules/home/unidade_escolar/unidade_escolar.controller.dart';

class UnidadeEscolarBinding implements Bindings {
  @override
  dependencies() {
    Get.lazyPut<UnidadeEscolarController>(() => UnidadeEscolarController(
      monitoramentoRepository: MonitoramentoRepository(),
    ));
  }
}