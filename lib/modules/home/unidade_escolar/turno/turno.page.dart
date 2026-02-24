import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:sme_prefeitura_sao_paulo_app/data/model/ambiente.dart';
import 'package:sme_prefeitura_sao_paulo_app/global_widgets/ambiente.widget.dart';
import 'package:sme_prefeitura_sao_paulo_app/global_widgets/empty.widget.dart';
import 'package:sme_prefeitura_sao_paulo_app/global_widgets/filtros_paginacao.widget.dart';
import 'package:sme_prefeitura_sao_paulo_app/global_widgets/my_scaffold.widget.dart';
import 'package:sme_prefeitura_sao_paulo_app/modules/home/unidade_escolar/turno/turno.controller.dart';

class TurnoPage extends GetView<TurnoController> {

  @override
  Widget build(BuildContext context) {
    return MyScaffoldWidget(
      title: 'LB0020'.tr,
      body: getBody(),
    );
  }

  getBody() {
    return Column(
      children: [
        FiltrosPaginacaoWidget(
          unidadeEscolar: controller.unidadeEscolar,
          turno: controller.turno,
        ),
        Expanded(
          child: getLista()
        )
      ],
    );
  }

  getLista() {
    return Obx(() {
      if (controller.reloadPage.value == null || controller.lista == null) return EmptyWidget();
      return controller.lista.isEmpty ?
        Align(alignment: Alignment.topCenter, child: Text("Nenhum ambiente disponível")) :
        ListView.separated(
          padding: EdgeInsets.symmetric(vertical: 20),
          separatorBuilder: (context, index) => Divider(height: 1),
          itemCount: controller.lista.length,
          itemBuilder: (context, index) => getItem(controller.lista[index]),
        );
    
    });
  }

  Widget getItem(Ambiente t) {
    return AmbienteWidget(
      ambiente: t, 
      onTap: controller.abrir
    );
  }
}