import 'package:dio/dio.dart';
import 'package:sme_prefeitura_sao_paulo_app/data/service/login.service.dart';
import 'package:sme_prefeitura_sao_paulo_app/utils/app_preferences.utils.dart';
import 'package:sme_prefeitura_sao_paulo_app/utils/loading.utils.dart';
import 'package:sme_prefeitura_sao_paulo_app/utils/message.utils.dart';
import 'package:sme_prefeitura_sao_paulo_app/utils/utils.dart';

class ApiBackProvider {

    static const timeoutDefault = Duration(seconds: 10);

    static String urlLocal = "http://192.168.1.110:3001/api/app";
    static String urlDev = "https://dev-limpeza.sme.prefeitura.sp.gov.br/api/app";
    static String urlProd = "https://limpeza.sme.prefeitura.sp.gov.br/api/app";
    static String backEndUrl = urlLocal;

    static doGet(url, {timeout = timeoutDefault}) async {
      return _getDio().get(_getUrl(url)).catchError(onError);
    }

    static doPost(url, data, {timeout = timeoutDefault}) async {
      return _getDio().post(_getUrl(url), data: data).catchError(onError);
    }

    static doPut(url, data, {timeout = timeoutDefault}) async {
      return _getDio().put(_getUrl(url), data: data).catchError(onError);
    }

    static doDelete(url, {timeout = timeoutDefault}) async {
      return _getDio().delete(_getUrl(url)).catchError(onError);
    }   

    static onError([err, trace]) {
      try {
        if (err.response.statusCode == 401) {
          LoginService.logout();
        }
      } catch (e) {
        if (err.response == null || err.response.statusCode == null) {
          LoadingUtils.hide();
          
          MessageUtils.showError();
          throw e;
        }
      }

      return checkResult(err.response);
    }

    static checkResult(response) {
      Map<String, dynamic> body = response.data;
      if (response.statusCode == 401) {
        LoginService.logout();       
      }

      if (body['status'] == false || response.statusCode != 200) {
        LoadingUtils.hide();

        var msg = MessageUtils.translate('MG002');
        try {
          msg = Utils.coalesce(body['data'], msg);
        } catch (e) {}
        MessageUtils.showError(msg);
        throw msg;
      }
      return body['data'];
    }     

    static _getUrl(url) {
      url = backEndUrl + url;
      print(url);
      return url;
    }

    static Dio _getDio() {
      Dio dio = Dio();
      dio.options.connectTimeout = 20000;
      dio.interceptors.add(_getInterceptor());

      return dio;
    }

    static  _getInterceptor() {
      return InterceptorsWrapper(
          onRequest:(RequestOptions options, handler) => _onRequestInterceptor(options, handler),
          onError: (DioError e, _) async {
            print(e);
            return  e;//continue
          }
      );
    }

    static _onRequestInterceptor(RequestOptions options, handler) async {
      options.headers.addAll({"Content-type": "application/json"});
      
      String jwt = AppPreferencesUtils.getToken();
      if (jwt != null) {
        options.headers.addAll({"authorization": "Bearer $jwt"});
      }

      int ue = AppPreferencesUtils.getUE();
      if (ue != null) {
        options.headers.addAll({"ue": ue});
      }

      handler.next(options);
    }
}
