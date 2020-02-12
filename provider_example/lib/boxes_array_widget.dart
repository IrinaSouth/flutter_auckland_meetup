import 'package:flutter/material.dart';
import 'package:flutter_auckland_feb20/model.dart';
import 'package:provider/provider.dart';

import 'WidgetKeys.dart';
import 'coloured_text_box_widget.dart';
import 'model.dart';


class BoxesArrayWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Selector<SliderBloc, double>(
              selector: (o, n) => n.box1,
              builder: (ctx, s, widget) {
                return ColouredTextBoxWidget(
                  key: Key(WidgetKeys.box1),
                  displayValue:s.toString(),
                  color: Colors.indigo,
                );
              },
            ),
            Selector<SliderBloc, double>(
              selector: (o, n) => n.box2,
              builder: (ctx, s, widget) {
                return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ColouredTextBoxWidget(
                      key: Key(WidgetKeys.box2),
                      displayValue: s.toString(),
                      color: Colors.amber,
                    )
                );
              },
            ),
          ],
        ),
        Consumer<SliderBloc>(
          builder: (ctx, sb, w) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Selector<SliderBloc, double>(
                  selector: (o, n) => n.box3,
                  builder: (ctx, s, widget) {
                    return ColouredTextBoxWidget(
                      key: Key(WidgetKeys.box3),
                      displayValue:s.toString(),
                      color: Colors.indigo,
                    );
                  },
                ),
                Selector<SliderBloc, double>(
                  selector: (o, n) => n.box4,
                  builder: (ctx, s, widget) {
                    return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ColouredTextBoxWidget(
                          key: Key(WidgetKeys.box4),
                          displayValue: s.toString(),
                          color: Colors.amber,
                        )
                    );
                  },
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
