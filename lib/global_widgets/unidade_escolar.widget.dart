import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sme_prefeitura_sao_paulo_app/data/model/unidade_escolar.dart';
import 'package:sme_prefeitura_sao_paulo_app/global_widgets/unidade_escolar_icon.widget.dart';
import 'package:sme_prefeitura_sao_paulo_app/theme/colors.theme.dart';

class UnidadeEscolarWidget extends StatelessWidget {
  const UnidadeEscolarWidget({Key key, this.unidadeEscolar, this.onTap, this.completo = true}) : super(key: key);

  final UnidadeEscolar unidadeEscolar;
  final onTap;
  final bool completo;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: getItem(),
    );
  }

  getItem() {
    return ListTile(
      title: Text("${unidadeEscolar.codigo} - ${unidadeEscolar.descricao}"),
      subtitle: completo ? Text(unidadeEscolar.endereco) : null,
      leading: UnidadeEscolarIconWidget(),
      trailing: onTap == null ? null : Icon(FontAwesomeIcons.chevronRight, color: ColorsTheme.GREY_THINGS, size: 14,),
      tileColor: Colors.white,
      onTap: onTap == null ? null :()=>onTap(unidadeEscolar),
    );
  }
}