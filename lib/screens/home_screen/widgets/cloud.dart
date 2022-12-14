import 'package:flutter/material.dart';

class Cloud extends StatefulWidget {
  final BoxConstraints constraints;

  const Cloud({Key? key, required this.constraints}) : super(key: key);

  @override
  State<Cloud> createState() => _CloudState();
}

class _CloudState extends State<Cloud> with SingleTickerProviderStateMixin {
  final cloudImagePath = 'assets/images/cloud.png';
  final cloudSizeMultiplier = 0.4;
  final cloudPositionXMultiplier = 0;
  final cloudPositionYMultiplier = 0.2;
  final animationDuration = const Duration(seconds: 6);

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: animationDuration,
        lowerBound: -widget.constraints.maxWidth * cloudSizeMultiplier,
        upperBound: widget.constraints.maxWidth)
      ..addStatusListener(
        (status) {
          if (status == AnimationStatus.completed) {
            _controller.reset();
          } else if (status == AnimationStatus.dismissed) {
            _controller.forward();
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
      top: widget.constraints.maxHeight * cloudPositionYMultiplier,
      left: widget.constraints.maxWidth * cloudPositionXMultiplier,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget? child) {
          return Transform.translate(
            offset: Offset(_controller.value, 0),
            child: child,
          );
        },
        child: Image.asset(
          cloudImagePath,
          height: widget.constraints.maxWidth * cloudSizeMultiplier,
          width: widget.constraints.maxWidth * cloudSizeMultiplier,
        ),
      ),
    );
  }
}
