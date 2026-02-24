import 'package:get/get.dart';
import 'package:sme_prefeitura_sao_paulo_app/data/model/ambiente.dart';
import 'package:sme_prefeitura_sao_paulo_app/data/model/turno.dart';
import 'package:sme_prefeitura_sao_paulo_app/data/model/unidade_escolar.dart';
import 'package:sme_prefeitura_sao_paulo_app/data/repository/monitoramento.repository.dart';
import 'package:sme_prefeitura_sao_paulo_app/routes/routes.dart';
import 'package:sme_prefeitura_sao_paulo_app/utils/loading.utils.dart';

class TurnoController extends GetxController {

  TurnoController({this.monitoramentoRepository});
  final MonitoramentoRepository monitoramentoRepository;
  
  var reloadPage = false.obs;

  List<Ambiente> lista;
  
  Turno turno;
  UnidadeEscolar unidadeEscolar;
  

  @override
  onInit() {
    turno = Get.arguments['turno'];    
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
    lista = await monitoramentoRepository.buscarAmbientesPorTurno(turno.idTurno);
    this.reloadPage.toggle();
  }

  abrir(Ambiente m) {
    Get.toNamed(Routes.AMBIENTE, arguments: {"unidadeEscolar": unidadeEscolar, "turno": turno, "ambiente": m});
  }

}