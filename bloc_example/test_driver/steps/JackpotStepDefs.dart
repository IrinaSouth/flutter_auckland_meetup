import 'package:ogurets/ogurets_core.dart';
import 'package:ogurets/ogurets.dart';

import '../page/slider_page.dart';

class JackpotStepDefs {
  SliderPage _sliderPage;

  JackpotStepDefs(this._sliderPage);

  @Then("I should see jackpot message {string}")
  Future<void> i_should_see_jackpot(String expectedMessage) async {
    final actualMessage = await _sliderPage.getJackpotMessage();
    assert(actualMessage == expectedMessage, 'expected message: $expectedMessage but actual message is: $actualMessage');
  }

  @Then("I should not see jackpot message")
  Future<void> i_should_not_see_jackpot() async {
    assert(await _sliderPage.jackpotMessageExists() == false, 'jackpot message is visible');
  }
}
