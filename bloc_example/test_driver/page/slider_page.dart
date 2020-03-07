import 'dart:async';
import 'package:ogurets_flutter/ogurets_flutter.dart';
import 'package:flutter_driver/flutter_driver.dart';

import '../../lib/WidgetKeys.dart';

class SliderPage {
  final FlutterOgurets _world;

  SliderPage(this._world);

  Future<void> slideSliders(table) async {
    for (var sliderVal in table) {
      final slider1Increment = double.parse(sliderVal["slider 1"]);
      final slider2Increment = double.parse(sliderVal["slider 2"]);
      await _world.driver.scroll(find.byValueKey(WidgetKeys.slider), getOffsetValue(slider1Increment), 0, Duration(seconds: 1));
      await _world.driver.scroll(find.byValueKey(WidgetKeys.slider2), getOffsetValue(slider2Increment), 0, Duration(seconds: 1));
      await Future.delayed(Duration(seconds: 5));
    }
  }

  Future<bool> verifyBoxValues(table) async {
    for (var row in table) {
      if (await _world.driver.getText(find.byValueKey('${WidgetKeys.box1}-text')) != row["box 1"]) return false;
      if (await _world.driver.getText(find.byValueKey('${WidgetKeys.box2}-text')) != row["box 2"]) return false;
      if (await _world.driver.getText(find.byValueKey('${WidgetKeys.box3}-text')) != row["box 3"]) return false;
      if (await _world.driver.getText(find.byValueKey('${WidgetKeys.box4}-text')) != row["box 4"]) return false;
    }
    return true;
  }
}

getOffsetValue(increment) {
  return (increment - 5) * 30;
}
