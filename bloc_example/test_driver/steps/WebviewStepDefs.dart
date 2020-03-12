import 'package:ogurets/ogurets_core.dart';
import 'package:ogurets/ogurets.dart';
import 'package:ogurets_flutter/ogurets_flutter.dart';

import '../page/slider_page.dart';

class WebviewStepDefs {
  SliderPage _sliderPage;
  FlutterOgurets _world;

  WebviewStepDefs(this._sliderPage, this._world);

  @When(r"I open webview")
  Future<void> i_open_webview() async {
    await _sliderPage.openWebview();
  }

  @When(r"the url should be {string}")
  Future<void> url_should_be(String url) async {
    await Future.delayed(Duration(seconds: 3));
    final actualUrl = await _world.driver.requestData("getWebViewUrl");
    assert(url == actualUrl, 'actual url: $actualUrl is not the same as expected url: $url');
  }
}
