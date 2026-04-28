import 'package:sme_prefeitura_sao_paulo_app/data/service/login.service.dart';

class Routes {
  static Future<String> get initialRoute async {
    if (await LoginService.isLoggedIn()) {
      return HOME;
    } else {
      return LOGIN;
    }
  }


static const String LOGIN = "/login";
static const String HOME = "/home";
static const String UNIDADE_ESCOLAR = "/unidade_escolar";
static const String TURNO = "/turno";
static const String AMBIENTE = "/ambiente";
static const String MONITORAMENTO = "/monitoramento";
static const String PLANO_TRABALHO = "/plano_trabalho";

}