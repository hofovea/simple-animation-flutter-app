import 'package:flutter/material.dart';

class Cloud extends StatefulWidget {
  final BoxConstraints constraints;

  const Cloud({Key? key, required this.constraints}) : super(key: key);

  @override
  State<Cloud> createState() => _CloudState();
}

class _CloudState extends State<Cloud> with SingleTickerProviderStateMixin {
  final _cloudImagePath = 'assets/images/cloud.png';
  late final _cloudSize = 0.4 * widget.constraints.maxWidth;
  final _cloudPositionXMultiplier = 0;
  final _cloudPositionYMultiplier = 0.2;
  final _animationDuration = const Duration(seconds: 6);

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: _animationDuration,
        lowerBound: -_cloudSize,
        upperBound: widget.constraints.maxWidth)
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
      top: widget.constraints.maxHeight * _cloudPositionYMultiplier,
      left: widget.constraints.maxWidth * _cloudPositionXMultiplier,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget? child) {
          return Transform.translate(
            offset: Offset(_controller.value, 0),
            child: child,
          );
        },
        child: Image.asset(
          _cloudImagePath,
          height: _cloudSize,
          width: _cloudSize,
        ),
      ),
    );
  }
}
