import 'package:ogurets/ogurets_core.dart';
import 'package:ogurets/ogurets.dart';

import '../page/slider_page.dart';

class SlidersStepDefs {
  SliderPage _sliderPage;

  SlidersStepDefs(this._sliderPage);

  @When(r"I slide the sliders")
  Future<void> i_slide_the_sliders(GherkinTable table) async {
    await _sliderPage.slideSliders(table);
  }

  @When(r"I slide slider (.*) by (.*)")
  Future<void> i_slide_the_slider(String slider, int increment) async {
    switch (slider) {
      case '1':
        await _sliderPage.slideSlider1By(increment);
        break;
      case '2':
        await _sliderPage.slideSlider2By(increment);
        break;
    }
  }

  @Then("box (.*) should have value (.*)")
  Future<void> box_value_should(String boxNumber, String boxVal) async {
    switch (boxNumber) {
      case '1':
        final box1Val = await _sliderPage.getBox1Value();
        assert(box1Val == boxVal, 'box 1 have value: $box1Val but it is expected to be $boxVal');
        break;
      case '2':
        final box2Val = await _sliderPage.getBox2Value();
        assert(box2Val == boxVal, 'box 2 have value: $box2Val but it is expected to be $boxVal');        break;
      case '3':
        final box3Val = await _sliderPage.getBox3Value();
        assert(box3Val == boxVal, 'box 3 have value: $box3Val but it is expected to be $boxVal');        break;
      case '4':
        final box4Val = await _sliderPage.getBox4Value();
        assert(box4Val == boxVal, 'box 4 have value: $box4Val but it is expected to be $boxVal');        break;
    }
  }

  @Then("I should see")
  Future<void> i_should_see({table}) async {
    final box1Val = await _sliderPage.getBox1Value();
    final box2Val = await _sliderPage.getBox2Value();
    final box3Val = await _sliderPage.getBox3Value();
    final box4Val = await _sliderPage.getBox4Value();

    for (var row in table) {
      assert(box1Val == row["box 1"], 'box 1 have value: $box1Val but it is expected to be ${row["box 1"]}');
      assert(box2Val == row["box 2"], 'box 2 have value: $box2Val but it is expected to be ${row["box 2"]}');
      assert(box3Val == row["box 3"], 'box 3 have value: $box3Val but it is expected to be ${row["box 3"]}');
      assert(box4Val == row["box 4"], 'box 4 have value: $box4Val but it is expected to be ${row["box 4"]}');
    }
  }
}
