import 'package:flutter/widgets.dart';
import 'dart:math';

class WindmillCross extends StatefulWidget {
  final BoxConstraints constraints;

  const WindmillCross({Key? key, required this.constraints}) : super(key: key);

  @override
  State<WindmillCross> createState() => _WindmillCrossState();
}

class _WindmillCrossState extends State<WindmillCross> with SingleTickerProviderStateMixin {
  final crossSizeMultiplier = 0.7;
  final crossPositionXMultiplier = 0.13;
  final crossPositionYMultiplier = 0.04;
  final crossImagePath = 'assets/images/cross.png';
  final animationDuration = const Duration(seconds: 2);

  late final AnimationController _controller =
      AnimationController(vsync: this, duration: animationDuration)
        ..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            _controller.reverse();
          } else if (status == AnimationStatus.dismissed) {
            _controller.forward();
          }
        })
        ..forward();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.constraints.maxHeight * crossPositionYMultiplier,
      left: widget.constraints.maxWidth * crossPositionXMultiplier,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, child) {
          return Transform.rotate(
            angle: _controller.value * 2 * pi,
            child: child,
          );
        },
        child: Image.asset(
          crossImagePath,
          width: widget.constraints.maxWidth * crossSizeMultiplier,
          height: widget.constraints.maxWidth * crossSizeMultiplier,
        ),
      ),
    );
  }
}
