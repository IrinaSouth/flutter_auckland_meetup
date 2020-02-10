import 'package:flutter/material.dart';
import 'package:flutter_auckland_feb20/model.dart';
import 'package:provider/provider.dart';

import 'WidgetKeys.dart';
import 'coloured_text_box_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Auckland Meetup Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: ChangeNotifierProvider<SliderBloc>(
        create: (_) => SliderBloc(),
        child: MyHomePage(title: 'Flutter Auckland Meetup Demo'),
      )
      ,
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<SliderBloc>(context);

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child:
               Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'Slider sample app',
                    style: Theme.of(context).textTheme.display1,
                  ),
                  Slider(
                    key: Key(WidgetKeys.slider),
                    min: 0,
                    max: 10,
                    divisions: 10,
                    value: bloc.box1,
                    onChanged: (value) {
                      {
                        bloc.setSliderValue(value);
                      }
                    },
                  ),
                  Text('Second slider'),
                  Slider(
                    key: Key(WidgetKeys.slider2),
                    min: 0,
                    max: 10,
                    divisions: 10,
                    value: bloc.box3,
                    onChanged: (value) {
                      {
                        bloc.setSecondSliderValue(value);
                      }
                    },
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ColouredTextBoxWidget(
                            key: Key(WidgetKeys.box1),
                            displayValue: bloc.box1.toString(),
                            color: Colors.indigo,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: ColouredTextBoxWidget(
                              key: Key(WidgetKeys.box2),
                              displayValue: bloc.box2.toString(),
                              color: Colors.amber,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          ColouredTextBoxWidget(
                            key: Key(WidgetKeys.box3),
                            displayValue: bloc.box3.toString(),
                            color: Colors.teal,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: ColouredTextBoxWidget(
                              key: Key(WidgetKeys.box4),
                              displayValue: bloc.box4.toString(),
                              color: Colors.redAccent,
                            ),
                          )
                        ],
                      ),
                    ],
                  )
                ],
              )
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
