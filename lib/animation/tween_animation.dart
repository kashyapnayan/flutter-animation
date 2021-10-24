import 'package:flutter/material.dart';

class TweenAnimation extends StatefulWidget {
  const TweenAnimation({Key? key}) : super(key: key);

  @override
  _TweenAnimationState createState() => _TweenAnimationState();
}

class _TweenAnimationState extends State<TweenAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> animation;
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this,duration: const Duration(seconds: 2));
    animation = Tween(begin: 0.0, end: 6.0).animate(_controller)
    ..addStatusListener((status) {
      if(status == AnimationStatus.completed){
        _controller.reverse(from: 2);
      }
    })
    ..addListener(() {
      setState(() {
        debugPrint('Animation Tween ${animation.value}');
      });
    });
    _controller.addListener(() {
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
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              child: Text(
                _controller.isAnimating
                    ? _counter.toStringAsFixed(2)
                    : "Let's Begin",
                style: TextStyle(fontSize: 24.0 * animation.value + 16.0),
              ),
              onTap: () {
                _controller.forward(from: 0.0);
              },
            ),
          ],
        ),
      ),
    );
  }
}
