import 'package:flutter/material.dart';
import 'package:flutter_auckland_feb20/boxes_array_widget.dart';
import 'package:flutter_auckland_feb20/sliders.dart';

void main() => runApp(MyApp());

/// The root of the application.
class MyApp extends StatelessWidget {
  @override
  build(_) => MaterialApp(
        title: 'Flutter Auckland Meetup Demo',
        theme: ThemeData(primarySwatch: Colors.blueGrey),
        home: MyHomePage(title: 'Flutter Auckland Meetup Demo'),
      );
}

/// The application home page.
class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sliderValue = 5.0;

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Flexible(child: Text('Slider sample app', style: Theme.of(context).textTheme.display1)),

            // Slider control.
            SliderWidget(
              initialValue: sliderValue,
              valueChanged: (newValue) => {},
            ),

            // Boxes display.
            Expanded(
              flex: 2,
              child: Center(
                child: BoxesArrayWidget(boxDisplayValue: sliderValue),
              ),
            )
          ],
        ),
      ),
    );
  }
}
