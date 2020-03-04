import 'dart:async';
import 'dart:math';

import 'package:bloc_provider/bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auckland_feb20/bloc.dart';
import 'package:flutter_auckland_feb20/boxes_array_widget.dart';
import 'package:flutter_auckland_feb20/sliders.dart';

import 'WidgetKeys.dart';

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
          CollectorWatcher(),
          Text(
            'Slider sample app',
            style: Theme.of(context).textTheme.display1,
          ),
          SliderWidget(initialValue: bloc.slider1Value, valueChanged: (v) => bloc.addSliderValueToStream(v),),
          Text('Slider2'),
          SliderWidget(initialValue: bloc.slider2Value, valueChanged: (v) => bloc.addSlider2(v),),
          BoxesArrayWidget()
        ],
      )),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class CollectorWatcher extends StatefulWidget {
  @override
  _CollectorWatcherState createState() => _CollectorWatcherState();
}

class _CollectorWatcherState extends State<CollectorWatcher> {
  StreamSubscription<double> totalBlocPartySub;
  int jackpot = 10;

  @override
  Widget build(BuildContext context) {
    return SizedBox.shrink();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (totalBlocPartySub != null) {
      totalBlocPartySub.cancel();
    }

//    totalBlocPartySub =
        BlocProvider.of<SliderBloc>(context).combined.listen((double val) {
      print("val is $val vs $jackpot");
      if (val.toInt() == jackpot) {
        jackpot = jackpotFunc();
        InfoDialog.show(context, 'JACKPOT', Icons.expand_less, 'you have hit the jackpot!');
      }
    });
  }

  @override
  void dispose() {
    super.dispose();

    if (totalBlocPartySub != null) {
      totalBlocPartySub.cancel();
    }
  }
}

typedef int JackpotFunc();

JackpotFunc jackpotFunc = () => Random().nextInt(20);


const _BOREDER_RADIUS = Radius.circular(4);
const _SEGMENT_PADDING = EdgeInsets.symmetric(vertical: 10.0, horizontal: 14);

class InfoDialog extends StatelessWidget {
  final String title;
  final String message;
  final IconData titleIcon;

  static show(
      BuildContext context,
      String title,
      IconData titleIcon,
      String message,
      ) =>
      showDialog(
          context: context,
          builder: (context) {
            return InfoDialog(
              title: title,
              titleIcon: titleIcon,
              message: message,
            );
          });

  const InfoDialog({
    @required this.title,
    @required this.message,
    @required this.titleIcon,
  });

  @override
  Widget build(context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(_BOREDER_RADIUS)),
      titlePadding: EdgeInsets.zero,
      title: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(topLeft: _BOREDER_RADIUS, topRight: _BOREDER_RADIUS),
        ),
        child: Padding(
          padding: _SEGMENT_PADDING,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(child: Text(title, style: TextStyle(color: Colors.white))),
              Icon(titleIcon, color: Colors.white, size: 22),
            ],
          ),
        ),
      ),
      contentPadding: _SEGMENT_PADDING,
      content: SingleChildScrollView(
        child: Wrap(
          runSpacing: 8,
          children: <Widget>[
            Container(
              child: Text(message,
                  key: ValueKey(WidgetKeys.infodialog),
                  style: TextStyle(color: Colors.black)),
            ),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(top: 4),
                child: Text("OK",
                    style: TextStyle(color: Colors.blue),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
