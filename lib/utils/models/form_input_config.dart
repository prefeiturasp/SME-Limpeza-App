import 'package:flutter/cupertino.dart';
import 'package:sme_prefeitura_sao_paulo_app/utils/form_validate.utils.dart';
import 'package:sme_prefeitura_sao_paulo_app/utils/utils.dart';

class FormInputConfig {

  FormInputConfig({
    this.name, 
    this.validacoes, 
    this.label, 
    this.controller, 
    this.padding = const EdgeInsets.only(left: 20, right: 20, bottom: 5, top: 5), 
    this.obscureText = false,
    this.textCapitalization = TextCapitalization.sentences,
    this.textInputType = TextInputType.text,
    this.icon,
    this.tipoDropdown = false
  }) {
    controller = TextEditingController();
  }

  String name;
  String label;
  TextEditingController controller;
  List<String> validacoes;
  EdgeInsets padding;
  bool obscureText;
  TextInputType textInputType;
  TextCapitalization textCapitalization;
  IconData icon;
  bool tipoDropdown;

  FormInputConfig colunaDaDireita() {
    padding = EdgeInsets.only(left: 5, right: padding.right, top: padding.top, bottom: padding.bottom);
    return this;
  }

  FormInputConfig colunaDaEsquerda() {
    padding = EdgeInsets.only(left: padding.left, right: 5, top: padding.top, bottom: padding.bottom);
    return this;
  }

  FormInputConfig colunaDoMeio() {
    padding = EdgeInsets.only(left: 5, right: 5, top: padding.top, bottom: padding.bottom);
    return this;
  }

  FormInputConfig tipoDouble() {
    textInputType = TextInputType.number;
    validacoes = validacoes == null ? [] : validacoes;
    validacoes.add(FormValidateUtils.NUMEROS_DECIMAIS);
    return this;
  }

  FormInputConfig tipoNumero() {
    textInputType = TextInputType.number;
    validacoes = validacoes == null ? [] : validacoes;
    validacoes.add(FormValidateUtils.SOMENTE_NUMEROS);
    return this;
  }

  FormInputConfig tipoSenha() {
    obscureText = true;
    validacoes = validacoes == null ? [] : validacoes;
    validacoes.add(FormValidateUtils.SENHA);
    return this;
  }

  FormInputConfig tipoEmail() {
    textInputType = TextInputType.emailAddress;
    textCapitalization = TextCapitalization.none;
    return this;
  }

  FormInputConfig obrigatorio() {
    validacoes = validacoes == null ? [] : validacoes;
    validacoes.add(FormValidateUtils.OBRIGATORIO);
    return this;
  }

  String getValue() {
    return controller.text;
  }

  int getIntValue() {
    try {
      return int.parse(getValue());
    } catch(e) {
      return null;
    }
  }

  double getDoubleValue() {
    try {
      String val = getValue().replaceAll(",", ".");
      return double.parse(val) + 0.00;
    } catch(e) {
      return null;
    }
  }

  void setValue(String value) {
    value = value == "null" ? null : value;
    controller = TextEditingController(text: Utils.coalesce(value, null));
  }

  void setEmpty() {
    controller.text = null;
  }

  bool isObrigatorio() {
    return validacoes != null && validacoes.contains(FormValidateUtils.OBRIGATORIO);
  }
}