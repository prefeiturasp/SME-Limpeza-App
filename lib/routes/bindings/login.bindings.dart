import 'package:get/get.dart';
import 'package:sme_prefeitura_sao_paulo_app/data/repository/login.repository.dart';
import 'package:sme_prefeitura_sao_paulo_app/modules/login/login.controller.dart';

class LoginBinding implements Bindings {
  @override
  dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(
      repository: LoginRepository()
    ));
  }
}