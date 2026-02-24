import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:sme_prefeitura_sao_paulo_app/data/model/monitoramento.dart';
import 'package:sme_prefeitura_sao_paulo_app/data/repository/monitoramento.repository.dart';
import 'package:sme_prefeitura_sao_paulo_app/modules/home/unidade_escolar/turno/ambiente-geral/ambiente.controller.dart';
import 'package:sme_prefeitura_sao_paulo_app/modules/home/unidade_escolar/turno/turno.controller.dart';
import 'package:sme_prefeitura_sao_paulo_app/modules/home/unidade_escolar/unidade_escolar.controller.dart';
import 'package:sme_prefeitura_sao_paulo_app/routes/routes.dart';
import 'package:sme_prefeitura_sao_paulo_app/utils/loading.utils.dart';
import 'package:sme_prefeitura_sao_paulo_app/utils/message.utils.dart';
import 'package:sme_prefeitura_sao_paulo_app/utils/utils.dart';

class MonitoramentoController extends GetxController {

  MonitoramentoController({this.monitoramentoRepository});

  final MonitoramentoRepository monitoramentoRepository;

  UnidadeEscolarController unidadeEscolarController = Get.find();
  TurnoController turnoController = Get.find();
  AmbienteController ambienteController = Get.find();
  
  Monitoramento monitoramento;
  var reloadPage = false.obs;

  @override
  onInit() {
    monitoramento = Get.arguments['monitoramento'];

    super.onInit();    
  }

  abrirPlanoTrabalho() {
    Get.toNamed(Routes.PLANO_TRABALHO, arguments: {"monitoramento": monitoramento});
  }

  escanearInicioTrabalho() async {
    String scan = await Utils.escanearQrCodeValido();

    if (scan == monitoramento.ambiente.hash) {
      LoadingUtils.show();
        
      Position p = await Utils.getGeo();

      monitoramento.dataHoraInicio = DateTime.now();
      monitoramento.latitudeInicio = p.latitude;
      monitoramento.longitudeInicio = p.longitude;

      await monitoramentoRepository.atualizar(monitoramento);
      await ambienteController.buscarMonitoramentos();
      
      Utils.successReturn(backPage: false, showMsg: false);

      this.reloadPage.toggle();
    } else {
      MessageUtils.showError('MG007'.tr);
    }
  }

  finalizar(Monitoramento m) {
    monitoramento = m;
    unidadeEscolarController.buscarLista();

    this.reloadPage.toggle();
  }

}