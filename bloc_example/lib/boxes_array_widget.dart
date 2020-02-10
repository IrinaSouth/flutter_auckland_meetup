import 'package:flutter/material.dart';

import 'coloured_text_box_widget.dart';

class BoxesArrayWidget extends StatelessWidget {
  final String displayValue;

  const BoxesArrayWidget({Key key, @required this.displayValue})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ColouredTextBoxWidget(
              displayValue: displayValue,
              color: Colors.indigo,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ColouredTextBoxWidget(
                displayValue: displayValue,
                color: Colors.amber,
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ColouredTextBoxWidget(
              displayValue: displayValue,
              color: Colors.teal,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ColouredTextBoxWidget(
                displayValue: displayValue,
                color: Colors.redAccent,
              ),
            )
          ],
        ),
      ],
    );
  }
}
