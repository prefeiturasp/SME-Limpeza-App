import 'package:get_storage/get_storage.dart';
import 'package:sme_prefeitura_sao_paulo_app/data/model/login.dart';
import 'package:sme_prefeitura_sao_paulo_app/data/model/usuario.dart';

class AppPreferencesUtils {

  static const _TOKEN = 'token';
  static const _USUARIO = 'usuario';
  static const _UNIDADE_ESCOLAR = 'unidade_escolar';
  static const _LOGIN = 'login';

  static GetStorage box = GetStorage();

  static setToken(String token) => box.write(_TOKEN, token);
  static getToken() => box.read(_TOKEN);

  static void setLogin(Login login) => box.write(_LOGIN, login.toMap());
  static Login getLogin() => box.read(_LOGIN) != null ? Login.fromMap(box.read(_LOGIN)) : null;

  static void setUsuario(Usuario usuario) => box.write(_USUARIO, usuario.toMap());
  static Usuario getUsuario() => box.read(_USUARIO) != null ? Usuario.fromMap(box.read(_USUARIO)) : null;

  static void setUE(int value) => box.write(_UNIDADE_ESCOLAR, value);
  static int getUE() => box.read(_UNIDADE_ESCOLAR);
  
  static clear() => box.erase();
}