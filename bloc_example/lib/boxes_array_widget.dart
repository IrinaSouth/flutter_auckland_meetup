import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';

import 'WidgetKeys.dart';
import 'bloc.dart';
import 'coloured_text_box_widget.dart';

class BoxesArrayWidget extends StatelessWidget {
  const BoxesArrayWidget({Key key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<SliderBloc>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ColouredTextBoxWidget(
              testKey: WidgetKeys.box1,
              displayValue: bloc.box1,
              color: Colors.indigo,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ColouredTextBoxWidget(
                testKey: WidgetKeys.box2,
                displayValue: bloc.box2,
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
              testKey: WidgetKeys.box3,
              displayValue: bloc.box3,
              color: Colors.teal,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ColouredTextBoxWidget(
                testKey: WidgetKeys.box4,
                displayValue: bloc.box4,
                color: Colors.redAccent,
              ),
            )
          ],
        ),
      ],
    );
  }
}
