import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:sme_prefeitura_sao_paulo_app/global_widgets/my_text_field.widget.dart';
import 'package:sme_prefeitura_sao_paulo_app/modules/login/login.controller.dart';
import 'package:sme_prefeitura_sao_paulo_app/theme/colors.theme.dart';
import 'package:sme_prefeitura_sao_paulo_app/utils/assets.utils.dart';

class LoginPage extends GetView<LoginController> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  getBody() {
    return Stack(
      alignment: Alignment.center,
      overflow: Overflow.visible,
      children: [
        getLogo(),
        getForm()
      ],
    );
  }

  getLogo() {
    return Positioned(
      top: (Get.size.height / 2) - 260, 
      child: Image.asset(AssetsUtils.logo, scale: 2.2,),
    );
  }

  getForm() {
    return Container(
      margin: EdgeInsets.only(top: (Get.size.height / 2) - 140),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Form(
          key: controller.formKey,
          child: ListView(
            children: [
              getInputEmail(),
              getInputSenha(),
              getButtonAcessar(),
            ],
          ),
        ),
      ),
    );
  }

  getInputEmail() => MyTextFieldWidget(
    config: controller.form.cnpj,
    onEditingComplete: () => controller.senhaFocusNode.requestFocus(),
  );

  getInputSenha() => MyTextFieldWidget(
    config: controller.form.senha, 
    focusNode: controller.senhaFocusNode,
    onEditingComplete: () => controller.carregando.value ? {} : controller.login()
  );

  getButtonAcessar() {
    return ObxValue((data) => Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        child: FlatButton(
          color: ColorsTheme.PRIMARY,
          textColor: Colors.white,
          onPressed: controller.carregando.value ? null : controller.login, 
          child: controller.carregando.value ? CircularProgressIndicator() : Text('LB0002'.tr)
        )
      ), 
      controller.carregando
    );
  }

}