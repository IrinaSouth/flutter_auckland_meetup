import 'package:ogurets/ogurets_core.dart';
import 'package:ogurets/ogurets.dart';

import '../page/slider_page.dart';

class DialogStepDefs {
  SliderPage _sliderPage;

  DialogStepDefs(this._sliderPage);

  @When(r"I tap on button")
  Future<void> i_tap_button() async {
    await _sliderPage.tapButton();
  }

  @When(r"I should see a dialog with title {string}")
  Future<void> i_should_see_dialog_with_title(String title) async {
    assert(await _sliderPage.getDialogTitle() == title);
  }
}
