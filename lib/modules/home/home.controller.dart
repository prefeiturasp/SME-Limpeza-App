import 'package:get/get.dart';
import 'package:sme_prefeitura_sao_paulo_app/data/model/unidade_escolar.dart';
import 'package:sme_prefeitura_sao_paulo_app/data/repository/unidade_escolar.repository.dart';
import 'package:sme_prefeitura_sao_paulo_app/routes/routes.dart';
import 'package:sme_prefeitura_sao_paulo_app/utils/app_preferences.utils.dart';
import 'package:sme_prefeitura_sao_paulo_app/utils/loading.utils.dart';

class HomeController extends GetxController {

  HomeController({this.unidadeEscolarRepository});

  final UnidadeEscolarRepository unidadeEscolarRepository;

  @override
  onInit() {
    loadAsync();
    super.onInit();    
  }

  var reloadPage = false.obs;

  List<UnidadeEscolar> listUnidadeEscolar;

  loadAsync() async{
    await Future.delayed(Duration(milliseconds: 10));

    LoadingUtils.show();
    listUnidadeEscolar = await unidadeEscolarRepository.combo();
    LoadingUtils.hide();

    this.reloadPage.toggle();
  }

  abrirUnidadeEscolar(UnidadeEscolar ue) {
    AppPreferencesUtils.setUE(ue.id);
    Get.toNamed(Routes.UNIDADE_ESCOLAR, arguments: {"unidadeEscolar": ue});
  }

}