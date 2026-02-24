import 'package:get/get.dart';
import 'package:sme_prefeitura_sao_paulo_app/data/model/login.dart';
import 'package:sme_prefeitura_sao_paulo_app/data/model/login_retorno.dart';
import 'package:sme_prefeitura_sao_paulo_app/data/repository/login.repository.dart';
import 'package:sme_prefeitura_sao_paulo_app/routes/routes.dart';
import 'package:sme_prefeitura_sao_paulo_app/utils/app_preferences.utils.dart';

class LoginService {

  static final _repository = LoginRepository();

  static login(Login login) async {
    LoginRetorno res = await _repository.login(login);
    LoginService.setDadosLogin(res, login);    
  }

  static isLoggedIn() async {
    try {
      Login login = AppPreferencesUtils.getLogin();

      if (login != null && AppPreferencesUtils.getUsuario() != null) {
        await LoginService.login(login);
        return true;
      }
    } catch (e) {
      print(e);
    }
    return false; 
  }

  static refreshToken() async {
    var res = await _repository.refreshToken();
    AppPreferencesUtils.setToken(res['accessToken']);
  }

  static void setDadosLogin(LoginRetorno res, Login login) {
    AppPreferencesUtils.setToken(res.accessToken);
    AppPreferencesUtils.setUsuario(res.prestadorServico);
    AppPreferencesUtils.setLogin(login);
  }

  static logout() {
    AppPreferencesUtils.clear();
    Get.offNamed(Routes.LOGIN);
  }

}