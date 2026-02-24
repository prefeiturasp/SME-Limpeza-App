import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:sme_prefeitura_sao_paulo_app/data/model/turno.dart';
import 'package:sme_prefeitura_sao_paulo_app/global_widgets/empty.widget.dart';
import 'package:sme_prefeitura_sao_paulo_app/global_widgets/filtros_paginacao.widget.dart';
import 'package:sme_prefeitura_sao_paulo_app/global_widgets/my_scaffold.widget.dart';
import 'package:sme_prefeitura_sao_paulo_app/global_widgets/turno.widget.dart';
import 'package:sme_prefeitura_sao_paulo_app/modules/home/unidade_escolar/unidade_escolar.controller.dart';

class UnidadeEscolarPage extends GetView<UnidadeEscolarController> {

  @override
  Widget build(BuildContext context) {
    return MyScaffoldWidget(
      title: 'LB0021'.tr,
      body: getBody(),
    );
  }

  getBody() {
    return Column(
      children: [
        FiltrosPaginacaoWidget(unidadeEscolar: controller.unidadeEscolar),
        Expanded(
          child: getLista()
        )
      ],
    );
  }


  getLista() {
    return Obx(() {
      if (controller.reloadPage.value == null || controller.listTurno == null) return EmptyWidget();
      return Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: controller.listTurno.isEmpty ?
          Align(alignment: Alignment.topCenter, child: Text("Nenhum turno disponível")) :
          ListView.separated(
            separatorBuilder: (context, index) => Divider(height: 1),
            itemCount: controller.listTurno.length,
            itemBuilder: (context, index) => getItem(controller.listTurno[index]),
          ),
      );
    
    });
  }

  Widget getItem(Turno t) {
    return TurnoWidget(turno: t, onTap: controller.abrir,);
  }
}