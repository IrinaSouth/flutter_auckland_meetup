import 'package:flutter/material.dart';

import 'coloured_text_box_widget.dart';

class BoxesArrayWidget extends StatelessWidget {
  final double boxDisplayValue;
  final double boxDisplayValue2;

  const BoxesArrayWidget({
    Key key,
    this.boxDisplayValue = 0.0,
    this.boxDisplayValue2 = 10.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final box2DisplayValue = 10 - boxDisplayValue;
    final box3DisplayValue = boxDisplayValue2;
    final box4DisplayValue = 10 - boxDisplayValue2;

    print("---- Build box list ----");

    return Wrap(
      direction: Axis.vertical,
      spacing: 12,
      children: <Widget>[
        Wrap(
          direction: Axis.horizontal,
          spacing: 12,
          children: <Widget>[
            ColouredTextBoxWidget(
              displayValue: boxDisplayValue,
              color: Colors.indigo,
            ),
            ColouredTextBoxWidget(
              displayValue: box2DisplayValue,
              color: Colors.amber,
            )
          ],
        ),
        Wrap(
          direction: Axis.horizontal,
          spacing: 12,
          children: <Widget>[
            ColouredTextBoxWidget(
              displayValue: box3DisplayValue,
              color: Colors.teal,
            ),
            ColouredTextBoxWidget(
              displayValue: box4DisplayValue,
              color: Colors.redAccent,
            )
          ],
        ),
      ],
    );
  }
}
