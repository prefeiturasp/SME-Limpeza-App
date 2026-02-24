import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageUtils {

  static translate(str) => "$str".tr;

  static showMessage(String message, {title = 'Aviso', iconData = Icons.info, bgColor = Colors.white}) {
    return Get.snackbar(
      title,
      message,
      icon: Icon(iconData),
      snackPosition: SnackPosition.TOP,
      backgroundColor: bgColor,
      colorText: Colors.black87,
      borderRadius: 0,
      duration: Duration(seconds: 5),
      isDismissible: true,
      //messageText: EmptyWidget()
    );
  }

  static showSuccess([String message]) => showMessage(message == null ? 'MG001'.tr : message, title: "Sucesso", iconData: Icons.check, bgColor: Colors.green[100]);
  static showError([String message]) => showMessage(message == null ? 'MG002'.tr : message, title: "Erro", iconData: Icons.close, bgColor: Colors.red[100]);

  static buildMessage(String msg, List<String> params) {
    for (int x=0; x< params.length; x++) {
      msg = msg.replaceAll("{$x}", params[0]);
    }
    return msg;
  }

}