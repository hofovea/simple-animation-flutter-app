import 'package:flutter/material.dart';

class Sun extends StatefulWidget {
  final BoxConstraints constraints;

  const Sun({Key? key, required this.constraints}) : super(key: key);

  @override
  State<Sun> createState() => _SunState();
}

class _SunState extends State<Sun> with SingleTickerProviderStateMixin {
  final sunImagePath = 'assets/images/sun.png';
  final sunSizeMultiplier = 0.4;
  final sunPositionXMultiplier = -0.05;
  final sunPositionYMultiplier = -0.01;
  final animationDuration = const Duration(seconds: 2);

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: animationDuration, lowerBound: 0.7, upperBound: 1.3)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      })
      ..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.constraints.maxHeight * sunPositionYMultiplier,
      left: widget.constraints.maxWidth * sunPositionXMultiplier,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget? child) {
          return Transform.scale(
            scale: _controller.value,
            child: child,
          );
        },
        child: Image.asset(
          sunImagePath,
          width: widget.constraints.maxWidth * sunSizeMultiplier,
          height: widget.constraints.maxWidth * sunSizeMultiplier,
        ),
      ),
    );
  }
}
