import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sme_prefeitura_sao_paulo_app/data/service/login.service.dart';
import 'package:sme_prefeitura_sao_paulo_app/global_widgets/empty.widget.dart';

class MyScaffoldWidget extends StatelessWidget {
  const MyScaffoldWidget({Key key, this.title, @required this.body, this.footerButtons, this.showExit = true, this.onZoomIn, this.onZoomOut }) : super(key: key);

  final Widget body;
  final String title;
  final List<Widget> footerButtons;
  final bool showExit;
  final onZoomIn;
  final onZoomOut;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: getBotoesFooter(),
      body: body,
      appBar: getAppBar(),
    );
  }

  AppBar getAppBar() {
    return AppBar(
      title: Text(title),
      actions: [
        onZoomIn != null ? 
          IconButton(icon: Icon(FontAwesomeIcons.searchPlus), onPressed: onZoomIn) :
          EmptyWidget(),
        onZoomOut != null ? 
          IconButton(icon: Icon(FontAwesomeIcons.searchMinus), onPressed: onZoomOut) :
          EmptyWidget(),

        showExit ? 
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: IconButton(icon: Icon(FontAwesomeIcons.signOutAlt), onPressed: LoginService.logout),
          ):
          EmptyWidget()
      ],
    );
  }

  List<Widget> getBotoesFooter() {
    return footerButtons;
  }
}