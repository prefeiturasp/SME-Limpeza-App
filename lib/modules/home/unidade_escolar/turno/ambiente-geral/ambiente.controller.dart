import 'package:get/get.dart';
import 'package:sme_prefeitura_sao_paulo_app/data/model/ambiente.dart';
import 'package:sme_prefeitura_sao_paulo_app/data/model/monitoramento.dart';
import 'package:sme_prefeitura_sao_paulo_app/data/model/turno.dart';
import 'package:sme_prefeitura_sao_paulo_app/data/model/unidade_escolar.dart';
import 'package:sme_prefeitura_sao_paulo_app/data/repository/monitoramento.repository.dart';
import 'package:sme_prefeitura_sao_paulo_app/routes/routes.dart';
import 'package:sme_prefeitura_sao_paulo_app/utils/loading.utils.dart';

class AmbienteController extends GetxController {

  AmbienteController({this.monitoramentoRepository});

  final MonitoramentoRepository monitoramentoRepository;

  var reloadPage = false.obs;

  List<Monitoramento> listMonitoramento;
  List<Turno> listTurno;

  UnidadeEscolar unidadeEscolar;
  Turno turno;
  Ambiente ambiente;
  
  @override
  onInit() {
    unidadeEscolar = Get.arguments['unidadeEscolar'];  
    turno = Get.arguments['turno'];  
    ambiente = Get.arguments['ambiente'];  

    loadAsync();
    super.onInit();    
  }

  loadAsync() async{
    await Future.delayed(Duration(milliseconds: 10));

    LoadingUtils.show();
    await buscarMonitoramentos();
    LoadingUtils.hide();
  }

  buscarMonitoramentos() async {
    listMonitoramento = await monitoramentoRepository.buscarMonitoramentosPorTurnoEAmbiente(turno.idTurno, ambiente.idAmbienteGeral);
    this.reloadPage.toggle();
  }

  abrirMonitoramento(Monitoramento m) async {
    await Get.toNamed(Routes.MONITORAMENTO, arguments: {"monitoramento": m});
    buscarMonitoramentos();
  }

}