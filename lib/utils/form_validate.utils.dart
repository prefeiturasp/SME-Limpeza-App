import 'package:get/get.dart';

class FormValidateUtils {

  static const OBRIGATORIO = "ob";
  static const SOMENTE_NUMEROS = "sn";
  static const NUMEROS_DECIMAIS = "nc";
  static const EMAIL = "email";
  static const SENHA = "email";

  static validarValor(String valor, List<String> validacoes) {
    if (validacoes == null || validacoes.isEmpty) {
      return null;
    }

    try {
      validacoes.forEach((v) { 
        switch (v) {
          case OBRIGATORIO:
          if (!validarVariavelVazia(valor)) throw Exception("MG003".tr);
          break;
          case SOMENTE_NUMEROS:
          if (!validarVariavelSomenteNumero(valor)) throw Exception("MG004".tr);
          break;
        }
      });
    } catch (e) {
      return e.message;
    }

    return null;
  }

  static bool validarVariavelVazia(dynamic value) => value != null && value.toString().isNotEmpty;

  static bool validarVariavelSomenteNumero(dynamic value) => !validarVariavelVazia(value) || double.tryParse(value) != null;

  
}