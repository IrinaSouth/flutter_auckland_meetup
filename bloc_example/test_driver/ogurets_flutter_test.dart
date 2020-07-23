import 'package:ogurets/ogurets.dart';
import 'package:ogurets_flutter/FlutterOguretsHelperStepdefs.dart';
import 'package:ogurets_flutter/ogurets_flutter.dart';

import 'steps/DialogStepDefs.dart';
import 'steps/JackpotStepDefs.dart';
import 'steps/SlidersStepDefs.dart';
import 'steps/WebviewStepDefs.dart';

// THIS FILE IS GENERATED - it will be overwritten on each run.
// If you wish to use one, please just make a copy and use that.
// Your friendly Ogurets team - Irina Southwell & Richard Vowles
//  (and we hope supporting cast)
// if you have an issue please raise it on
// https://github.com/dart-ogurets/Ogurets (for core)
// https://github.com/dart-ogurets/OguretsFlutter (for ogurets_flutter)
// https://github.com/dart-ogurets/OguretsIntellij (for the Jetbrains IntelliJ plugin)
void main(args) async {
  var def = new OguretsOpts()
    ..feature('test_driver/features')
    ..instance(FlutterOgurets())
    ..debug()
    ..step(FlutterHooks)
    ..step(SlidersStepDefs)
    ..step(JackpotStepDefs)
    ..step(DialogStepDefs)
    ..step(WebviewStepDefs)
    ..step(FlutterOguretsHelperStepdefs);

  await def.run();
}
