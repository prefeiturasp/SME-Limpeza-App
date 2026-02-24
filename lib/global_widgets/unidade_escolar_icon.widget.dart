import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sme_prefeitura_sao_paulo_app/theme/colors.theme.dart';

class UnidadeEscolarIconWidget extends StatelessWidget {
  const UnidadeEscolarIconWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: ColorsTheme.GREY_THINGS,
      radius: 24,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 2, right: 4),
        child: Icon(
            FontAwesomeIcons.school,
            size: 18,
            color: Colors.black,
        ),
      ),
    );
  }
}