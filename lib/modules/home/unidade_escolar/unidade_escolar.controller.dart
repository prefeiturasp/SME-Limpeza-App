import 'package:get/get.dart';
import 'package:sme_prefeitura_sao_paulo_app/data/model/monitoramento.dart';
import 'package:sme_prefeitura_sao_paulo_app/data/model/turno.dart';
import 'package:sme_prefeitura_sao_paulo_app/data/model/unidade_escolar.dart';
import 'package:sme_prefeitura_sao_paulo_app/data/repository/monitoramento.repository.dart';
import 'package:sme_prefeitura_sao_paulo_app/routes/routes.dart';
import 'package:sme_prefeitura_sao_paulo_app/utils/loading.utils.dart';

class UnidadeEscolarController extends GetxController {

  UnidadeEscolarController({this.monitoramentoRepository});

  final MonitoramentoRepository monitoramentoRepository;

  var reloadPage = false.obs;

  UnidadeEscolar unidadeEscolar;
  List<Monitoramento> listMonitoramento;
  List<Turno> listTurno;
  
  @override
  onInit() {
    unidadeEscolar = Get.arguments['unidadeEscolar'];  

    loadAsync();
    super.onInit();    
  }

  loadAsync() async{
    await Future.delayed(Duration(milliseconds: 10));

    LoadingUtils.show();
    await buscarLista();
    LoadingUtils.hide();
  }

  buscarLista() async {
    listTurno = await monitoramentoRepository.buscarTurnos();
    this.reloadPage.toggle();
  }

  abrir(Turno m) {
    Get.toNamed(Routes.TURNO, arguments: {"unidadeEscolar": unidadeEscolar, "turno": m});
  }

}