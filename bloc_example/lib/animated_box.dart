import 'package:flutter/material.dart';

class AnimatedBox extends StatefulWidget {
  @override
  State createState() {
    return AnimatedBoxState();
  }
}

class AnimatedBoxState extends State with TickerProviderStateMixin {
  AnimationController controller;
  Animation colorAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
    colorAnimation = ColorTween(begin: Colors.blue, end: Colors.yellow).animate(controller);

    // Rebuilding the screen when animation goes ahead
    controller.addListener(() {
      setState(() {});
    });

    // Repeat the animation after finish
    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      color: colorAnimation.value,
    ));
  }

  @override
  dispose() {
    controller.dispose(); // you need this
    super.dispose();
  }
}
