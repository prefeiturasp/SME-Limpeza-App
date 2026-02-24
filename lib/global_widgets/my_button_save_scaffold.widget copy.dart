import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MyButtonSaveScaffoldWidget extends StatelessWidget {
  const MyButtonSaveScaffoldWidget({Key key, this.onSave}) : super(key: key);

  final onSave;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.zero,
      // width: Get.size.width,
      child: FlatButton(
        // color: Get.theme.primaryColor,
        // textColor: Colors.white,
        onPressed: onSave == null ? null : onSave, 
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(FontAwesomeIcons.check, size: 14,),
            ),
            Text("LB0004".tr.toUpperCase()),
          ],
        )
      ),
    );
  }
}