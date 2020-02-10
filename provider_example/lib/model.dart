

import 'package:flutter/material.dart';

class SliderBloc with ChangeNotifier {
  double _currentValue = 0.0;
  double _secondSlider = 0.0;

  double get box1 => _currentValue;
  double get box2 => (_currentValue + 1) % 10;
  double get box3 => _secondSlider;
  double get box4 => 10 - _secondSlider;

  void setSliderValue(double value) {
    _currentValue = value;
    notifyListeners();
  }

  void setSecondSliderValue(double value) {
    _secondSlider = value;
    notifyListeners();
  }
}
