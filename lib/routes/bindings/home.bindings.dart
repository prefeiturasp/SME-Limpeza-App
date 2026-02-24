import 'package:get/get.dart';
import 'package:sme_prefeitura_sao_paulo_app/data/repository/unidade_escolar.repository.dart';
import 'package:sme_prefeitura_sao_paulo_app/modules/home/home.controller.dart';

class HomeBinding implements Bindings {
  @override
  dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(
      unidadeEscolarRepository: UnidadeEscolarRepository()
    ));
  }
}