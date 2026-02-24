import 'package:sme_prefeitura_sao_paulo_app/data/service/login.service.dart';

class Routes {
  static Future<String> get initialRoute async {
    if (await LoginService.isLoggedIn()) {
      return HOME;
    } else {
      return LOGIN;
    }
  }

  static const String LOGIN = "LOGIN";
  static const String HOME = "HOME";
  static const String UNIDADE_ESCOLAR = "UNIDADE_ESCOLAR";
  static const String TURNO = "TURNO";
  static const String AMBIENTE = "AMBIENTE";
  static const String MONITORAMENTO = "MONITORAMENTO";
  static const String PLANO_TRABALHO = "PLANO_TRABALHO";

}