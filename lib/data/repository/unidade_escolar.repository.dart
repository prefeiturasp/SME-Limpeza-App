import 'package:sme_prefeitura_sao_paulo_app/data/model/unidade_escolar.dart';
import 'package:sme_prefeitura_sao_paulo_app/data/provider/api_back.provider.dart';

class UnidadeEscolarRepository {
  
  final String url = "/unidade-escolar";

  Future<List<UnidadeEscolar>> combo() async {
    return UnidadeEscolar.fromMapList(
      ApiBackProvider.checkResult(
        await ApiBackProvider.doGet("$url/combo")));
  }

}