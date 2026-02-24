
import 'package:flutter/widgets.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import 'loading.utils.dart';
import 'message.utils.dart';

class Utils {

  static Future<Position> getGeo() {
    return Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
  }

  static Future<String> escanearQrCodeValido() async {
    String scan = await FlutterBarcodeScanner.scanBarcode("#ff6666", "LB0005".tr, false, ScanMode.QR);

    if (Utils.isEmpty(scan) || scan == "-1") return null;
    return scan;    
  }

  static double toDouble(value) {
    if (Utils.isEmpty(value) || value.toString() == "null") return null;

    return double.parse(value.toString());
  }

  static successReturn({bool backPage = true, String msg, bool showMsg = true, int backTimes = 1}) {
    LoadingUtils.hide();
    if (backPage) {
      while(backTimes > 0) {
        Get.back();
        backTimes--;
      }
    }
    if (showMsg) {
      MessageUtils.showSuccess(msg);
    }
  }

  static unfocusAll() => FocusManager.instance.primaryFocus.unfocus();

  static dynamic getArgument(String key) {
    if (Get.arguments == null) return null;
    return Get.arguments[key];
  }
  
  static getExtension(String fileName) {
    var fileNameArr = fileName.split(".");
    return(fileNameArr[fileNameArr.length-1]);
  }

  static boolToInt(bool value) {
    return value != null && value ? 1 : 0;
  }

  static intToBool(int value) {
    return value != null && value == 1;
  }

  static coalesce(dynamic value, dynamic valueOr) {
    return value != null ? value : valueOr;
  }

  static isTrue(bool value) {
      if (value == null) {
        return false;
      }
      return value;
    }

    static isEmpty(value) {
      if (value == null) {
        return true;
      }
      if (value is String || value is List) {
        return value.isEmpty;
      } else {
        return false;
      }
    }

    static bool hasEmpty(List value) {
      if (value == null) {
        return true;
      }

      var ret = false;

      value.forEach((item) { 
        ret = isEmpty(item) ? true: ret;
      });

      return ret;
    }
}