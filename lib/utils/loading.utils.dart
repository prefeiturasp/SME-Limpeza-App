import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sme_prefeitura_sao_paulo_app/utils/assets.utils.dart';

class LoadingUtils {

  static bool _carregando = false;

  static void show() {
    if (!_carregando) {
      _carregando = true;
      Get.dialog(
        getBody(),
        barrierDismissible: false,
        barrierColor: Colors.black54
      );
    }         
  }

  static getBody() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200,
            child: Image.asset(AssetsUtils.logo),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: CircularProgressIndicator(),
          )
        ]
      )
    );    
  }

  static void hide() {
    if (_carregando) {
      Get.back();
      _carregando = false;
    }
  }
  
}