import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:sme_prefeitura_sao_paulo_app/data/model/monitoramento.dart';
import 'package:sme_prefeitura_sao_paulo_app/global_widgets/empty.widget.dart';
import 'package:sme_prefeitura_sao_paulo_app/global_widgets/filtros_paginacao.widget.dart';
import 'package:sme_prefeitura_sao_paulo_app/global_widgets/my_scaffold.widget.dart';
import 'package:sme_prefeitura_sao_paulo_app/modules/home/unidade_escolar/turno/ambiente-geral/ambiente.controller.dart';
import 'package:sme_prefeitura_sao_paulo_app/theme/colors.theme.dart';
import 'package:sme_prefeitura_sao_paulo_app/utils/date.utils.dart' as MyDateUtils;

class AmbientePage extends GetView<AmbienteController> {

  @override
  Widget build(BuildContext context) {
    return MyScaffoldWidget(
      title: 'LB0006'.tr,
      body: getBody(),
    );
  }

  getBody() {
    return Column(
      children: [
        FiltrosPaginacaoWidget(
          unidadeEscolar: controller.unidadeEscolar,
          turno: controller.turno,
          ambiente: controller.ambiente,
        ),
        Expanded(
          child: getLista()
        )
      ],
    );
  }


  getLista() {
    return Obx(() {
      if (controller.reloadPage.value == null || controller.listMonitoramento == null) return EmptyWidget();
      
      return controller.listMonitoramento.isEmpty ?
        Align(alignment: Alignment.topCenter, child: Text("Nenhum monitoramento disponível")) :
        ListView.separated(
          padding: EdgeInsets.symmetric(vertical: 20),
          separatorBuilder: (context, index) => Divider(height: 1),
          itemCount: controller.listMonitoramento.length,
          itemBuilder: (context, index) => getItem(controller.listMonitoramento[index]),
        );
    });
  }

  Widget getItem(Monitoramento c) {
    return ListTile(
      // contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      title: Text(c.ambiente.descricao),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("${c.periodicidade.descricao} / ${c.turno.descricao}"),
          Text(MyDateUtils.DateUtils.dateToFormat(datetime: c.data))
        ],
      ),
      isThreeLine: true,
      leading: getIconMonitoramento(),
      trailing: getStatusMonitoramento(c),
      onTap: () => controller.abrirMonitoramento(c),
      tileColor: Colors.white,
    );
  }

  getStatusMonitoramento(Monitoramento m) {
    return Chip(
      label: Text(
        m.dataHoraInicio != null ? 'LB0007'.tr : 'LB0008'.tr, 
        style: TextStyle(color: Colors.white, fontSize: Get.textTheme.caption.fontSize),
      ),
      backgroundColor: m.dataHoraInicio != null ? ColorsTheme.SUCCESS : ColorsTheme.ERROR,
    );
  }

  Widget getIconMonitoramento() {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 30,
        child: Padding(
          padding: const EdgeInsets.only(right: 4),
          child: Icon(
              FontAwesomeIcons.solidCircle,
              size: 18,
              color: Colors.black,
          ),
        ),
      ),
    );
  }
}