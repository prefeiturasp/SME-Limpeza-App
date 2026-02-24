import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sme_prefeitura_sao_paulo_app/data/model/ambiente.dart';
import 'package:sme_prefeitura_sao_paulo_app/global_widgets/empty.widget.dart';
import 'package:sme_prefeitura_sao_paulo_app/theme/colors.theme.dart';

class AmbienteWidget extends StatelessWidget {
  const AmbienteWidget({Key key, this.ambiente, this.onTap, this.showLeading = true}) : super(key: key);

  final Ambiente ambiente;
  final onTap;
  final showLeading;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: getItem(),
    );
  }

  getItem()  {
    if (ambiente == null) return EmptyWidget();
    
    return ListTile(
      // contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      title: Text(ambiente.descricao),
      leading: getIcon(),
      trailing: showLeading ? getStatus() : null,
      onTap: onTap == null ? null : () => onTap(ambiente),
    );
  }

  

   Widget getIcon() {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 30,
        child: Padding(
          padding: const EdgeInsets.only(right: 4),
          child: Icon(
              FontAwesomeIcons.doorOpen,
              size: 18,
              color: Colors.black,
          ),
        ),
      ),
    );
  }

  getStatus() {
    return Chip(
      label: Text(
        ambiente.total.toString(), 
        style: TextStyle(color: Colors.white, fontSize: Get.textTheme.caption.fontSize),
      ),
      backgroundColor: ambiente.total == "0" ? ColorsTheme.GREY_THINGS : ColorsTheme.ERROR,
    );
  }
}