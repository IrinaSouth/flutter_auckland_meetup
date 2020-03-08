import 'dart:async';
import 'package:ogurets_flutter/ogurets_flutter.dart';
import 'package:flutter_driver/flutter_driver.dart';

import '../../lib/WidgetKeys.dart';

class SliderPage {
  final FlutterOgurets _world;

  SliderPage(this._world);

  final box1 = find.byValueKey('${WidgetKeys.box1}-text');
  final box2 = find.byValueKey('${WidgetKeys.box2}-text');
  final box3 = find.byValueKey('${WidgetKeys.box3}-text');
  final box4 = find.byValueKey('${WidgetKeys.box4}-text');
  final slider = find.byValueKey(WidgetKeys.slider);
  final slider2 = find.byValueKey(WidgetKeys.slider2);
  final jackpotMessage = find.byValueKey(WidgetKeys.jackpotMessage);
  final dialog = find.byValueKey(WidgetKeys.dialogText);

  Future<void> slideSliders(table) async {
    for (var sliderVal in table) {
      final slider1Increment = int.parse(sliderVal["slider 1"]);
      final slider2Increment = int.parse(sliderVal["slider 2"]);
      await slideSlider1By(slider1Increment);
      await slideSlider2By(slider2Increment);
    }
  }

  Future<void> slideSlider1By(int increment) async {
    await _world.driver.scroll(slider, getOffsetValue(increment), 0, Duration(seconds: 1));
  }

  Future<void> slideSlider2By(int increment) async {
    await _world.driver.scroll(slider2, getOffsetValue(increment), 0, Duration(seconds: 1));
  }

  Future<String> getBox1Value() async {
    return await _world.driver.getText(box1);
  }

  Future<String> getBox2Value() async {
    return await _world.driver.getText(box2);
  }

  Future<String> getBox3Value() async {
    return await _world.driver.getText(box3);
  }

  Future<String> getBox4Value() async {
    return await _world.driver.getText(box4);
  }

  Future<String> getJackpotMessage() async {
    return await _world.driver.getText(jackpotMessage);
  }

  Future<bool> jackpotMessageExists() async {
    try {
      await _world.driver.waitFor(jackpotMessage, timeout: Duration(seconds: 3));
      return true;
    } catch (_) {
      return false;
    }
  }

  Future<String> getDialogTitle() async {
//    return await _world.driver.runUnsynchronized(() async {
//      return await _world.driver.getText(dialog, timeout: Duration(seconds: 5));
//    }, timeout: Duration(seconds: 5));
    return await _world.driver.getText(dialog);
  }

  Future<void> tapButton() async {
    await _world.driver.tap(find.byValueKey(WidgetKeys.tapHereButton));

  }
}

getOffsetValue(int increment) {
  return ((increment - 5) * 30).toDouble();
}
