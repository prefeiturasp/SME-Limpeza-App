import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:sme_prefeitura_sao_paulo_app/data/model/unidade_escolar.dart';
import 'package:sme_prefeitura_sao_paulo_app/global_widgets/empty.widget.dart';
import 'package:sme_prefeitura_sao_paulo_app/global_widgets/my_scaffold.widget.dart';
import 'package:sme_prefeitura_sao_paulo_app/global_widgets/unidade_escolar.widget.dart';
import 'package:sme_prefeitura_sao_paulo_app/modules/home/home.controller.dart';

class HomePage extends GetView<HomeController> {

  @override
  Widget build(BuildContext context) {
    return MyScaffoldWidget(
      title: 'LB0003'.tr,
      body: getBody(),
    );
  }

  getBody() {
    return Obx(() {
      if (controller.reloadPage.value == null || controller.listUnidadeEscolar == null) return EmptyWidget();
      
      return Container(
        padding: const EdgeInsets.only(top: 20.0),
        child: controller.listUnidadeEscolar.isEmpty ?
          Align(alignment: Alignment.topCenter, child: Text("Nenhuma unidade escolar disponível")) :
          ListView.separated(
            separatorBuilder: (context, index) => Divider(height: 1,),
            itemCount: controller.listUnidadeEscolar.length,
            itemBuilder: (context, index) => getUnidadeEscolar(controller.listUnidadeEscolar[index]),
          ),
      );
    });
  }

  Widget getUnidadeEscolar(UnidadeEscolar c) {
    return UnidadeEscolarWidget(unidadeEscolar: c, onTap: controller.abrirUnidadeEscolar,);
  }
}