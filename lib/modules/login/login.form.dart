import 'package:get/get.dart';
import 'package:sme_prefeitura_sao_paulo_app/data/model/login.dart';
import 'package:sme_prefeitura_sao_paulo_app/utils/models/form_input_config.dart';

class LoginForm {

  FormInputConfig cnpj = FormInputConfig(name: 'cnpj', label: 'LB0017'.tr)
    .tipoNumero()
    .obrigatorio();
  FormInputConfig senha = FormInputConfig(name: 'senha', label: 'LB0001'.tr)
    .tipoSenha()
    .obrigatorio();

  Login toModel() {
    return Login (
      cnpj: cnpj.getValue(),
      senha: senha.getValue(),
    );
  }

  LoginForm fromModel(Login v) {
    cnpj.setValue(v.cnpj);
    senha.setValue(v.senha);

    return this;
  }
}