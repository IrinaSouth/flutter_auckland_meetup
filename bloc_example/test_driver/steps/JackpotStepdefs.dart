import 'package:ogurets/ogurets_core.dart';
import 'package:ogurets/ogurets.dart';
import 'package:ogurets_flutter/ogurets_flutter.dart';
import 'package:flutter_driver/flutter_driver.dart';

import '../../lib/WidgetKeys.dart';

class JackpotStepdefs {
  FlutterOgurets _world;

  JackpotStepdefs(this._world);

  @And(r'I scroll the slider')
  void i_scroll_slider() async {
    await _world.driver.scroll(find.byValueKey(WidgetKeys.slider), -30,0,Duration(seconds: 1));
    await Future.delayed(Duration(seconds: 3));
    await _world.driver.scroll(find.byValueKey(WidgetKeys.slider2),30,0,Duration(seconds: 1));
    await Future.delayed(Duration(seconds: 3));
    await _world.driver.scroll(find.byValueKey(WidgetKeys.slider2),60,0,Duration(seconds: 1));
    await Future.delayed(Duration(seconds: 3));
    await _world.driver.scroll(find.byValueKey(WidgetKeys.slider2),90,0,Duration(seconds: 1));
    await Future.delayed(Duration(seconds: 3));
  }

}
