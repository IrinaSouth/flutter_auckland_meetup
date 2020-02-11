import 'package:bloc_provider/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class SliderBloc implements Bloc {
  final _sliderStream = BehaviorSubject<double>.seeded(0);

  get slider1Value => _sliderStream.value;
  get box1 => _sliderStream;
  get box2 => _sliderStream.map((s) => s + 1);
  get box3 => _sliderStream.map((s) => s > 0 ? s - 1 : 10.0);
  get box4 => _sliderStream.map((s) => 10 - s);

  addSliderValueToStream(double value) {
    _sliderStream.add(value);
  }

  @override
  void dispose() {
    _sliderStream.close();
  }
}
