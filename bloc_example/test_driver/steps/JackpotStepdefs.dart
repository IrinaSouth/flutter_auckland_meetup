import 'package:ogurets/ogurets_core.dart';
import 'package:ogurets/ogurets.dart';

import '../page/slider_page.dart';

class JackpotStepdefs {
  SliderPage _sliderPage;

  JackpotStepdefs(this._sliderPage);

  @When(r"I slide the sliders")
  Future<void> i_slide_the_sliders(GherkinTable table) async {
    await _sliderPage.slideSliders(table);
  }

  @Then("I should see")
  Future<void> i_should_see({table}) async {
    assert(await _sliderPage.verifyBoxValues(table) == true);
  }
}
