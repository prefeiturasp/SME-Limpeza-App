import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sme_prefeitura_sao_paulo_app/utils/form_validate.utils.dart';
import 'package:sme_prefeitura_sao_paulo_app/utils/models/form_input_config.dart';

class MyTextFieldWidget extends StatelessWidget {
  const MyTextFieldWidget({Key key, @required this.config, this.onEditingComplete, this.onTap, this.text, this.placeholder, this.focusNode}) : super(key: key);

  final FormInputConfig config;
  final onEditingComplete;
  final onTap;
  final text;
  final String placeholder;
  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: config.padding,
      child: TextFormField(
        onTap: () => onTap == null ? {} : onTap(),
        readOnly: config.tipoDropdown,
        focusNode: focusNode,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: placeholder,
          isDense: true,
          labelText: "${config.label}${config.isObrigatorio() ? ' *' : ''}",
          labelStyle: TextStyle(fontSize: Get.textTheme.bodyText1.fontSize),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          prefixIcon: config.icon != null ? Icon(config.icon) : null,
          suffixIcon: config.tipoDropdown ? Icon(Icons.arrow_drop_down) : null,
          prefixText: text,
          prefixStyle: TextStyle(fontSize: text != null ? Get.textTheme.bodyText1.fontSize : 0)     
        ),
        style: TextStyle(fontSize: text == null ? Get.textTheme.bodyText1.fontSize : 0),
        controller: config.controller,
        obscureText: config.obscureText,
        keyboardType: config.textInputType,
        textCapitalization: config.textCapitalization,
        validator: (String v) => FormValidateUtils.validarValor(v, config.validacoes),
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onEditingComplete: () => onEditingComplete == null ? {} : onEditingComplete(),   
      ),
    );
  }
}