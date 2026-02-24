import 'package:flutter_html/style.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:sme_prefeitura_sao_paulo_app/data/model/monitoramento.dart';
import 'package:sme_prefeitura_sao_paulo_app/data/repository/monitoramento.repository.dart';
import 'package:sme_prefeitura_sao_paulo_app/modules/home/unidade_escolar/turno/ambiente-geral/ambiente.controller.dart';
import 'package:sme_prefeitura_sao_paulo_app/modules/home/unidade_escolar/turno/ambiente-geral/monitoramento/monitoramento.controller.dart';
import 'package:sme_prefeitura_sao_paulo_app/modules/home/unidade_escolar/turno/turno.controller.dart';
import 'package:sme_prefeitura_sao_paulo_app/modules/home/unidade_escolar/unidade_escolar.controller.dart';
import 'package:sme_prefeitura_sao_paulo_app/utils/loading.utils.dart';
import 'package:sme_prefeitura_sao_paulo_app/utils/message.utils.dart';
import 'package:sme_prefeitura_sao_paulo_app/utils/utils.dart';

class PlanoTrabalhoController extends GetxController {

  PlanoTrabalhoController({this.monitoramentoRepository});

  final MonitoramentoRepository monitoramentoRepository;

  MonitoramentoController monitoramentoController = Get.find();

  final reloadPage = false.obs;

  Monitoramento monitoramento;

  UnidadeEscolarController unidadeEscolarController = Get.find();
  TurnoController turnoController = Get.find();
  AmbienteController ambienteController = Get.find();

  double fontSize = FontSize.large.size;

  @override
  onInit() {
    monitoramento = Get.arguments['monitoramento'];
    super.onInit();    
  }

  escanearFimDoTrabalho() async {
    String scan = await Utils.escanearQrCodeValido();

    if (scan == monitoramento.ambiente.hash) {
      LoadingUtils.show();
        
      Position p = await Utils.getGeo();

      monitoramento.dataHoraTermino = DateTime.now();
      monitoramento.latitudeTermino = p.latitude;
      monitoramento.longitudeTermino = p.longitude;

      await monitoramentoRepository.atualizar(monitoramento);
      monitoramentoController.finalizar(monitoramento);

      await unidadeEscolarController.buscarLista();
      await turnoController.buscarLista();
      await ambienteController.buscarMonitoramentos();
      
      Utils.successReturn(backPage: true, showMsg: false);
    } else {
      MessageUtils.showError('MG007'.tr);
    }
  }

  zoomIn() {
    fontSize++;
    this.reloadPage.toggle();
  }

  zoomOut() {
    fontSize--;
    this.reloadPage.toggle();
  }

}