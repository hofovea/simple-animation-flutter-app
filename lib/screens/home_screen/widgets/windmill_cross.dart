import 'package:flutter/widgets.dart';
import 'dart:math';

class WindmillCross extends StatefulWidget {
  final BoxConstraints constraints;

  const WindmillCross({Key? key, required this.constraints}) : super(key: key);

  @override
  State<WindmillCross> createState() => _WindmillCrossState();
}

class _WindmillCrossState extends State<WindmillCross> with SingleTickerProviderStateMixin {
  late final _crossSize = 0.7 * widget.constraints.maxWidth;
  final _crossPositionXMultiplier = 0.13;
  final _crossPositionYMultiplier = 0.04;
  final _crossImagePath = 'assets/images/cross.png';
  final _animationDuration = const Duration(seconds: 2);

  late final AnimationController _controller =
      AnimationController(vsync: this, duration: _animationDuration)
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
      top: widget.constraints.maxHeight * _crossPositionYMultiplier,
      left: widget.constraints.maxWidth * _crossPositionXMultiplier,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (_, child) {
          return Transform.rotate(
            angle: _controller.value * 2 * pi,
            child: child,
          );
        },
        child: Image.asset(
          _crossImagePath,
          width: _crossSize,
          height: _crossSize,
        ),
      ),
    );
  }
}
