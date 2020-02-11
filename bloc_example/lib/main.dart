import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auckland_feb20/bloc.dart';
import 'package:flutter_auckland_feb20/boxes_array_widget.dart';
import 'package:flutter_auckland_feb20/sliders.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Auckland Meetup Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.green,
      ),
      home: BlocProvider<SliderBloc>(
        creator: (_context, _bag) {
          return SliderBloc();
        },
        child: MyHomePage(title: 'Flutter Auckland Meetup Demo'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<SliderBloc>(context);

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(title),
      ),
      body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            'Slider sample app',
            style: Theme.of(context).textTheme.display1,
          ),
          SliderWidget(initialValue: bloc.slider1Value, valueChanged: (v) => bloc.addSliderValueToStream(v),),
          BoxesArrayWidget()
        ],
      )),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
