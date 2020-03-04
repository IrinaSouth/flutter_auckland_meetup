import 'package:bloc_provider/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class SliderBloc implements Bloc {
  final _sliderStream = BehaviorSubject<double>.seeded(0);
  final _slider2Stream = BehaviorSubject<double>.seeded(0);

  get slider1Value => _sliderStream.value;
  get slider2Value => _slider2Stream.value;
  get box1 => _sliderStream;
  get box2 => _sliderStream.map((s) => s + 1);
  get box3 => _slider2Stream.map((s) => s > 0 ? s - 1 : 10.0);
  get box4 => _slider2Stream.map((s) => 10 - s);
  get combined => CombineLatestStream.combine2(_sliderStream, _slider2Stream, (a, b) => a + b);

  addSliderValueToStream(double value) {
    _sliderStream.add(value);
  }

  addSlider2(double v) {
    _slider2Stream.add(v);
  }

  @override
  void dispose() {
    _sliderStream.close();
    _slider2Stream.close();
  }
}
