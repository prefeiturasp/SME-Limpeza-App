import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoadingPageWidget extends StatelessWidget {
  const LoadingPageWidget({Key key, this.onDark = true}) : super(key: key);

  final bool onDark;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: 10.0),
        child: Center(child: CircularProgressIndicator())
      )
    );
  }
}
