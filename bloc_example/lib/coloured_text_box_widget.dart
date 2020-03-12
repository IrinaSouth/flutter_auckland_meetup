import 'package:flutter/material.dart';

class ColouredTextBoxWidget extends StatelessWidget {
  final Color color;
  final Stream<double> displayValue;
  final String testKey;

  const ColouredTextBoxWidget({
    Key key,
    @required this.displayValue,
    @required this.color, this.testKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      child: StreamBuilder<double>(
          stream: displayValue,
          builder: (context, snapshot) {
            print("build triggered ${snapshot.data}");

            return snapshot.hasData
                ? Text(
                    snapshot.data.toString(),
                    key: ValueKey(testKey+'-text')
                  )
                : SizedBox.shrink();
          }),
      color: color,
    );
  }
}
