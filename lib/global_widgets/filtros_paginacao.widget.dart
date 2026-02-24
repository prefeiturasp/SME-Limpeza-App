import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sme_prefeitura_sao_paulo_app/data/model/ambiente.dart';
import 'package:sme_prefeitura_sao_paulo_app/data/model/turno.dart';
import 'package:sme_prefeitura_sao_paulo_app/data/model/unidade_escolar.dart';
import 'package:sme_prefeitura_sao_paulo_app/global_widgets/turno.widget.dart';
import 'package:sme_prefeitura_sao_paulo_app/global_widgets/unidade_escolar.widget.dart';

import 'ambiente.widget.dart';

class FiltrosPaginacaoWidget extends StatelessWidget {
  const FiltrosPaginacaoWidget({Key key, this.unidadeEscolar, this.turno, this.ambiente, }) : super(key: key);

  final UnidadeEscolar unidadeEscolar;
  final Turno turno;
  final Ambiente ambiente;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(children: [
          UnidadeEscolarWidget(unidadeEscolar: unidadeEscolar, completo: false,),
          TurnoWidget(turno: turno, showLeading: false,),
          AmbienteWidget(ambiente: ambiente, showLeading: false,),
        ],),
      )
    );
  }
}