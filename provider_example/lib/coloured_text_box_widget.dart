import 'package:flutter/material.dart';

import 'WidgetKeys.dart';

class ColouredTextBoxWidget extends StatelessWidget {
  final Color color;
  final String displayValue;

  const ColouredTextBoxWidget({
    Key key,
    @required this.displayValue,
    @required this.color,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    print("building $displayValue");
    return Container(
      width: 80,
      padding: EdgeInsets.all(24),
      child: Text(displayValue, key: Key(WidgetKeys.boxText), textAlign: TextAlign.center,),
      color: color,
    );
  }
}