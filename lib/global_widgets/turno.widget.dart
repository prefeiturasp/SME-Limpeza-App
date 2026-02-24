import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sme_prefeitura_sao_paulo_app/data/model/turno.dart';
import 'package:sme_prefeitura_sao_paulo_app/global_widgets/empty.widget.dart';
import 'package:sme_prefeitura_sao_paulo_app/theme/colors.theme.dart';

class TurnoWidget extends StatelessWidget {
  const TurnoWidget({Key key, this.turno, this.onTap, this.showLeading = true}) : super(key: key);

  final Turno turno;
  final onTap;
  final showLeading;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: getTurno(),
    );
  }

  getTurno() {
    if (turno == null) return EmptyWidget();
    
    return ListTile(
      // contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      title: Text(turno.descricao),
      trailing: showLeading ? getStatus(turno) : null,
      leading: getIcon(),
      onTap: onTap == null ? null : () => onTap(turno),
    );
  }

  getStatus(Turno t) {
    return Chip(
      label: Text(
        t.total.toString(), 
        style: TextStyle(color: Colors.white, fontSize: Get.textTheme.caption.fontSize),
      ),
      backgroundColor: t.total == "0" ? ColorsTheme.GREY_THINGS : ColorsTheme.ERROR,
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
              FontAwesomeIcons.history,
              size: 18,
              color: Colors.black,
          ),
        ),
      ),
    );
  }
}