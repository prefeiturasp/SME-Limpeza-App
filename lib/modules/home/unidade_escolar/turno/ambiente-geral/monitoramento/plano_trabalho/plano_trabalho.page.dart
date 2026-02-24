import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:sme_prefeitura_sao_paulo_app/global_widgets/empty.widget.dart';
import 'package:sme_prefeitura_sao_paulo_app/global_widgets/my_button_scaffold.widget.dart';
import 'package:sme_prefeitura_sao_paulo_app/global_widgets/my_scaffold.widget.dart';
import 'package:sme_prefeitura_sao_paulo_app/modules/home/unidade_escolar/turno/ambiente-geral/monitoramento/plano_trabalho/plano_trabalho.controller.dart';

class PlanoTrabalhoPage extends GetView<PlanoTrabalhoController> {

  @override
  Widget build(BuildContext context) {
    return MyScaffoldWidget(
      title: 'LB0014'.tr,
      body: getBody(),
      onZoomIn: controller.zoomIn,
      onZoomOut: controller.zoomOut,
      footerButtons: [
        controller.monitoramento.dataHoraTermino == null ? 
          MyButtonScaffoldWidget(
            label: 'LB0011'.tr.toUpperCase(),
            onTap: controller.escanearFimDoTrabalho,
          ):
          MyButtonScaffoldWidget(
            label: 'LB0015'.tr.toUpperCase(),
            onTap: () => Get.back(),
            color: Colors.white,
          )
      ]
    );
  }

  getBody() {
    return Obx(() => controller.reloadPage.value == null ? 
      EmptyWidget() :
      CupertinoScrollbar(
        thickness: 8,
        child: ListView(
          children: [
            getCardAtividades()
          ],
        ),
      )
    );
  }

  getCardAtividades() {
    return Obx(() => controller.reloadPage.value == null ? 
      EmptyWidget() :
      Card(
        child: Html(
          data: "<html>${controller.monitoramento.atividades}</html>",
          style: {
            "html": Style(
              fontSize: FontSize(controller.fontSize)
            ),
          },
        ),
      )
    );
  }
}