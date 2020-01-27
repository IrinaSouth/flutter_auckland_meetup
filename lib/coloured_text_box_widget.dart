import 'package:flutter/material.dart';

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
    return Container(
      padding: EdgeInsets.all(24),
      child: Text(displayValue),
      color: color,
    );
  }
}