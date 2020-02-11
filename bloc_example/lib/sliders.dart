

import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';

import 'bloc.dart';

typedef ValueFunc(double value);

class SliderWidget extends StatefulWidget {
  final ValueFunc valueChanged;
  final double initialValue;

  const SliderWidget({Key key, @required this.valueChanged, @required this.initialValue}) :
      assert(valueChanged != null),
      assert(initialValue != null),
      super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SliderWidgetState();
  }
}

class _SliderWidgetState extends State<SliderWidget> {
  double value;

  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Slider(
      min: 0,
      max: 10,
      value: value,
      divisions: 10,
      onChanged: (value) {
        {
          widget.valueChanged(value);
          setState(() => this.value = value);
        }
      },
    );
  }

}