import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sme_prefeitura_sao_paulo_app/data/model/login.dart';
import 'package:sme_prefeitura_sao_paulo_app/data/repository/login.repository.dart';
import 'package:sme_prefeitura_sao_paulo_app/data/service/login.service.dart';
import 'package:sme_prefeitura_sao_paulo_app/modules/login/login.form.dart';
import 'package:sme_prefeitura_sao_paulo_app/routes/routes.dart';
import 'package:sme_prefeitura_sao_paulo_app/utils/utils.dart';

class LoginController extends GetxController {

  LoginController({@required this.repository});
  
  final LoginRepository repository;  
  FocusNode senhaFocusNode = FocusNode();

  var carregando = false.obs;

  LoginForm form = LoginForm();
  final formKey = GlobalKey<FormState>(); 
  
  @override
  onInit() {
    super.onInit();    
  }

  void login() async {
    try {
      Utils.unfocusAll();
      
      if (formKey.currentState.validate()) {
        carregando.toggle();

        Login login = form.toModel();
      
        await LoginService.login(login);
        Get.offAllNamed(Routes.HOME);
      }
    } catch (e) {
      print(e);
    }

    carregando.value = false;
  }

}