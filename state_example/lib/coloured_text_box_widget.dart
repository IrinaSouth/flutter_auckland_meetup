import 'package:flutter/material.dart';

class ColouredTextBoxWidget extends StatelessWidget {
  final Color color;
  final double displayValue;

  const ColouredTextBoxWidget({
    Key key,
    @required this.displayValue,
    @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("build triggered $displayValue");

    return AnimatedContainer(
      alignment: Alignment.center,
      duration: _animationDuration,
      padding: EdgeInsets.all(32 + 2 * displayValue),
      child: AnimatedDefaultTextStyle(
        duration: _animationDuration,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16 + 3 * displayValue,
          fontWeight: FontWeight.bold,
        ),
        child: Text(
          displayValue.toStringAsFixed(0),
        ),
      ),
      color: color,
    );
  }
}

final _animationDuration = Duration(milliseconds: 500);
