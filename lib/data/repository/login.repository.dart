import 'package:sme_prefeitura_sao_paulo_app/data/model/login.dart';
import 'package:sme_prefeitura_sao_paulo_app/data/model/login_retorno.dart';
import 'package:sme_prefeitura_sao_paulo_app/data/provider/api_back.provider.dart';

class LoginRepository {
  
  final String url = "/auth";

  login(Login login) async {
    return LoginRetorno.fromMap(
      ApiBackProvider.checkResult(
        await ApiBackProvider.doPost(url, login.toJson())));
  }

  refreshToken() async {
    return ApiBackProvider.checkResult(await ApiBackProvider.doGet("$url/refresh-token"));
  }

}