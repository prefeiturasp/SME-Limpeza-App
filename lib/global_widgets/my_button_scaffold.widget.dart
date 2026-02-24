import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class MyButtonScaffoldWidget extends StatelessWidget {
  const MyButtonScaffoldWidget({Key key, this.onTap, this.label, this.color}) : super(key: key);

  final onTap;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.zero,
      width: Get.size.width,
      child: FlatButton(
        color: color == null ? Get.theme.primaryColor : color,
        height: 50,
        onPressed: onTap == null ? null : onTap, 
        child: Text(label),
      ),
    );
  }
}