import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class ChainAnimation extends AnimatedWidget {
  static final _opacityTween = Tween<double>(begin: 0.1, end: 1.0);
  static final _sizeTween = Tween<double>(begin: 0.0, end: 175.0);

  ChainAnimation({Key? key, AnimationController? controller})
      : super(key: key, listenable: controller!);

  @override
  Widget build(BuildContext context) {
    final AnimationController animation = listenable as AnimationController;
    return Center(
      child: Opacity(
        opacity: animation.value,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          height: _sizeTween.evaluate(animation),
          width: _sizeTween.evaluate(animation),
          child: FlatButton(
            onPressed: () {

            },
            color: Colors.blue,
            child: const Text('Button'),
          ),
        ),
      ),
    );
  }
}
