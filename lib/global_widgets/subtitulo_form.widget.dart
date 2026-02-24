import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SubtituloFormWidget extends StatelessWidget {
  const SubtituloFormWidget({Key key, @required this.titulo}) : super(key: key);

  final String titulo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20 ),
      child: Text(titulo, style: Get.textTheme.headline6.merge(TextStyle(color: Colors.grey[800], fontWeight: FontWeight.normal))),
    );
  }
}