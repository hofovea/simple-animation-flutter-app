import 'dart:ui';

import 'package:flutter/material.dart';

class Bird extends StatefulWidget {
  final BoxConstraints constraints;

  const Bird({Key? key, required this.constraints}) : super(key: key);

  @override
  State<Bird> createState() => _BirdState();
}

class _BirdState extends State<Bird> with SingleTickerProviderStateMixin {
  final birdSizeMultiplier = 0.2;
  final birdPositionXMultiplier = 0;
  final birdPositionYMultiplier = 0.45;
  final birdImagePath = 'assets/images/bird.png';
  final animationDuration = const Duration(seconds: 4);
  late final Path _path = drawPath();

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: animationDuration, lowerBound: 0, upperBound: 1)
          ..addStatusListener(
            (status) {
              if (status == AnimationStatus.completed) {
                _controller.repeat();
              }
            },
          )
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
      top: 0,
      left: 0,
      child: AnimatedBuilder(
        animation: CurvedAnimation(curve: Curves.slowMiddle, parent: _controller),
        builder: (BuildContext context, Widget? child) {
          return Transform.translate(
            offset: calculatePosition(_controller.value),
            child: child,
          );
        },
        child: Image.asset(
          birdImagePath,
          height: widget.constraints.maxWidth * birdSizeMultiplier,
          width: widget.constraints.maxWidth * birdSizeMultiplier,
        ),
      ),
    );
  }

  Offset calculatePosition(double value) {
    PathMetrics pathMetrics = _path.computeMetrics();
    PathMetric pathMetric = pathMetrics.elementAt(0);
    value = pathMetric.length * value;
    Tangent? pos = pathMetric.getTangentForOffset(value);
    return pos!.position;
  }

  Path drawPath() {
    Size size =
        Size(widget.constraints.maxWidth, widget.constraints.maxHeight * birdPositionYMultiplier);
    Path path = Path();
    path.moveTo(0, size.height);
    path.quadraticBezierTo(size.width / 2, 0, size.width,
        size.height + widget.constraints.maxWidth * birdSizeMultiplier);
    return path;
  }
}
