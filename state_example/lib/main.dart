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
class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var value = 5.0;
  var value2 = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Flexible(child: Text('Slider sample app', style: Theme.of(context).textTheme.display1)),

            // Slider control 1.
            SliderWidget(
              initialValue: value,
              valueChanged: (newValue) {
                setState(() {
                  value = newValue;
                });
              },
            ),

            // Slider control 2.
            SliderWidget(
              initialValue: value,
              valueChanged: (newValue) {
                setState(() {
                  value2 = newValue;
                });
              },
            ),

            // Boxes display.
            Expanded(
              flex: 2,
              child: Center(
                child: BoxesArrayWidget(boxDisplayValue: value, boxDisplayValue2: value2),
              ),
            )
          ],
        ),
      ),
    );
  }
}
