import 'package:flutter/material.dart';

import 'coloured_text_box_widget.dart';

class BoxesArrayWidget extends StatelessWidget {
  final double boxDisplayValue;

  const BoxesArrayWidget({
    Key key,
    this.boxDisplayValue = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              displayValue: boxDisplayValue,
              color: Colors.amber,
            )
          ],
        ),
        Wrap(
          direction: Axis.horizontal,
          spacing: 12,
          children: <Widget>[
            ColouredTextBoxWidget(
              displayValue: boxDisplayValue,
              color: Colors.teal,
            ),
            ColouredTextBoxWidget(
              displayValue: boxDisplayValue,
              color: Colors.redAccent,
            )
          ],
        ),
      ],
    );
  }
}
