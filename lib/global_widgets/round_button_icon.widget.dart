import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RoundButtonWidget extends StatelessWidget {
  const RoundButtonWidget({Key key, @required this.icon, @required this.fgColor, @required this.bgColor, @required this.onPressed}) : super(key: key);

  final Icon icon;
  final Color fgColor;
  final Color bgColor;
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: bgColor,
      textColor: fgColor,
      child: icon,
      padding: EdgeInsets.all(16),
      shape: CircleBorder(),
    );
  }
}