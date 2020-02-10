

import 'package:flutter_auckland_feb20/model.dart';
import 'package:flutter_test/flutter_test.dart';

// we don't test the provider framework, we expect that to work
void main() {
  test('Setting the model generates the expected values', () {
    final sb = SliderBloc();
    sb.setSliderValue(1.0);
    expect(sb.box1, 1.0);
    expect(sb.box2, 2.0);
    expect(sb.box3, 0.0);
    expect(sb.box4, 9.0);
    sb.setSliderValue(8.0);
    expect(sb.box1, 8.0);
    expect(sb.box2, 9.0);
    expect(sb.box3, 7.0);
    expect(sb.box4, 2.0);
  });
}