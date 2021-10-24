import 'package:flutter/material.dart';

class CounterAnimation extends StatefulWidget {
  const CounterAnimation({Key? key}) : super(key: key);

  @override
  _CounterAnimationState createState() => _CounterAnimationState();
}

class _CounterAnimationState extends State<CounterAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation;
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn)
      ..addListener(() {
        setState(() {
          _counter++;
          debugPrint('print $_counter');
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(_controller.isAnimating
          ? _counter.toStringAsFixed(2)
          : "Let's Begin",
        style: TextStyle(fontSize:  24.0 * _controller.value + 16.0),
      ),
      onTap: (){
        _controller.forward(from: 0.0);
      },
    );
  }
}