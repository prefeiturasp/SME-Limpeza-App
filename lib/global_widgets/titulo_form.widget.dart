import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sme_prefeitura_sao_paulo_app/theme/colors.theme.dart';

class TituloFormWidget extends StatelessWidget {
  const TituloFormWidget({Key key, @required this.titulo}) : super(key: key);

  final String titulo;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: ColorsTheme.PRIMARY,
            width: 5.0,
          ),          
        )
      ),
      padding: const EdgeInsets.only(left:15, top:20, right: 20, bottom: 20),
      child: Row(
        children: [
          Expanded(
            child: Text(titulo, style: Get.textTheme.headline5.merge(TextStyle(color: ColorsTheme.PRIMARY)))
          ),
          // Icon(FontAwesomeIcons.car, color: Colors.grey[800],),
        ]
      )
    );
  }
}