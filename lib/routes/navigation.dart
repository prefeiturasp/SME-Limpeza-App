import 'package:get/get.dart';
import 'package:sme_prefeitura_sao_paulo_app/modules/home/home.page.dart';
import 'package:sme_prefeitura_sao_paulo_app/modules/home/unidade_escolar/turno/ambiente-geral/ambiente.page.dart';
import 'package:sme_prefeitura_sao_paulo_app/modules/home/unidade_escolar/turno/ambiente-geral/monitoramento/monitoramento.page.dart';
import 'package:sme_prefeitura_sao_paulo_app/modules/home/unidade_escolar/turno/ambiente-geral/monitoramento/plano_trabalho/plano_trabalho.page.dart';
import 'package:sme_prefeitura_sao_paulo_app/modules/home/unidade_escolar/turno/turno.page.dart';
import 'package:sme_prefeitura_sao_paulo_app/modules/home/unidade_escolar/unidade_escolar.page.dart';
import 'package:sme_prefeitura_sao_paulo_app/modules/login/login.page.dart';
import 'package:sme_prefeitura_sao_paulo_app/routes/bindings/ambiente.bindings.dart';
import 'package:sme_prefeitura_sao_paulo_app/routes/bindings/home.bindings.dart';
import 'package:sme_prefeitura_sao_paulo_app/routes/bindings/login.bindings.dart';
import 'package:sme_prefeitura_sao_paulo_app/routes/bindings/monitoramento.bindings.dart';
import 'package:sme_prefeitura_sao_paulo_app/routes/bindings/plano_trabalho.bindings.dart';
import 'package:sme_prefeitura_sao_paulo_app/routes/bindings/turno.bindings.dart';
import 'package:sme_prefeitura_sao_paulo_app/routes/bindings/unidade_escolar.bindings.dart';
import 'package:sme_prefeitura_sao_paulo_app/routes/routes.dart';

class Navigation {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.LOGIN, 
      page: () => LoginPage(),
      binding: LoginBinding()
    ),
    GetPage(
      name: Routes.HOME, 
      page: () => HomePage(),
      binding: HomeBinding()
    ),
    GetPage(
      name: Routes.UNIDADE_ESCOLAR, 
      page: () => UnidadeEscolarPage(),
      binding: UnidadeEscolarBinding()
    ),
    GetPage(
      name: Routes.TURNO, 
      page: () => TurnoPage(),
      binding: TurnoBinding()
    ),
    GetPage(
      name: Routes.AMBIENTE, 
      page: () => AmbientePage(),
      binding: AmbienteBinding()
    ),
    GetPage(
      name: Routes.MONITORAMENTO, 
      page: () => MonitoramentoPage(),
      binding: MonitoramentoBinding()
    ),
    GetPage(
      name: Routes.PLANO_TRABALHO, 
      page: () => PlanoTrabalhoPage(),
      binding: PlanoTrabalhoBinding()
    ),
  ];
}