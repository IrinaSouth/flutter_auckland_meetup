import 'package:bloc_provider/bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class SliderBloc implements Bloc{

final _sliderStream = BehaviorSubject<double>();
get sliderStream => _sliderStream;

SliderBloc(){}

addSliderValueToStream(double value) {
_sliderStream.add(value);
}

  @override
  void dispose() {
  _sliderStream.close();
  }

}