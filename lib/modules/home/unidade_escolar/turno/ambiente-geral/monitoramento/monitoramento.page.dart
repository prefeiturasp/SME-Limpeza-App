import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:sme_prefeitura_sao_paulo_app/global_widgets/empty.widget.dart';
import 'package:sme_prefeitura_sao_paulo_app/global_widgets/my_button_scaffold.widget.dart';
import 'package:sme_prefeitura_sao_paulo_app/global_widgets/my_scaffold.widget.dart';
import 'package:sme_prefeitura_sao_paulo_app/modules/home/unidade_escolar/turno/ambiente-geral/monitoramento/monitoramento.controller.dart';
import 'package:sme_prefeitura_sao_paulo_app/theme/colors.theme.dart';

class MonitoramentoPage extends GetView<MonitoramentoController> {

  @override
  Widget build(BuildContext context) {
    return MyScaffoldWidget(
      title: 'LB0009'.tr,
      body: getBody(),
      footerButtons: [
        Obx(() {
          if (controller.reloadPage.value == null) return EmptyWidget();
          return getFooterButton();
        })
      ]
    );
  }

  Widget getFooterButton() {
    if (controller.monitoramento.dataHoraTermino != null) {
      return MyButtonScaffoldWidget(
        color: Colors.white,
        label: 'LB0015'.tr.toUpperCase(),
        onTap: () => Get.back(),
      );            
    } else if (controller.monitoramento.dataHoraInicio == null) {
      return MyButtonScaffoldWidget(
        label: 'LB0010'.tr.toUpperCase(),
        onTap: controller.escanearInicioTrabalho,
      );
    } else {
      return MyButtonScaffoldWidget(
        label: 'LB0012'.tr.toUpperCase(),
        onTap: controller.abrirPlanoTrabalho,
      );
    }
  }

  getBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          getCardAula()
        ],
      ),
    );
  }

  getCardAula() {
    return Obx(() {
      if (controller.reloadPage.value == null) return EmptyWidget();

      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Column(
            children: [
              getIconeGrande(),
              getMensagemGrande(),
              getTitulo(),
              getSubtitulo()
            ],
          ),
        ),
      );
    });
  }

  getIconeGrande() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Center(
        child: Icon(
          controller.monitoramento.dataHoraTermino != null ? FontAwesomeIcons.solidCheckCircle :           
            controller.monitoramento.dataHoraInicio == null ? FontAwesomeIcons.timesCircle : FontAwesomeIcons.checkCircle,
          color: controller.monitoramento.dataHoraInicio == null ? ColorsTheme.ERROR : ColorsTheme.SUCCESS,
          size: 120,
        ),
      ),
    );
  }

  getMensagemGrande() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 50),
      child: Text(
        controller.monitoramento.dataHoraTermino != null ? 
          'MG008'.tr :
          controller.monitoramento.dataHoraInicio == null ? 'MG005'.tr : 'MG006'.tr,
        style: Get.textTheme.headline4.merge(TextStyle(
          fontWeight: FontWeight.w300,
          color: Colors.black
        )),
        textAlign: TextAlign.center,
      ),
    );
  }

  getTitulo() {
    return Container(
      padding: EdgeInsets.only(left: 12, bottom: 5),
      width: double.infinity, 
      child: Text(
        controller.monitoramento.ambiente.descricao,
        style: TextStyle(fontWeight: FontWeight.bold),
        textAlign: TextAlign.start,
      )
    );
  }

  getSubtitulo() {
    return Container(
      padding: EdgeInsets.only(left: 12, bottom: 14),
      width: double.infinity,
      child: Text(
        controller.monitoramento.ambiente.tipo,
        style: Get.textTheme.caption,
      ),
    );
  }
}