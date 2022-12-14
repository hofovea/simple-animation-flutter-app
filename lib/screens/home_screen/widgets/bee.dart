import 'dart:math';

import 'package:flutter/material.dart';

class Bee extends StatefulWidget {
  final BoxConstraints constraints;

  const Bee({Key? key, required this.constraints}) : super(key: key);

  @override
  State<Bee> createState() => _BeeState();
}

class _BeeState extends State<Bee> with SingleTickerProviderStateMixin {
  late final _beeSize = 0.1 * widget.constraints.maxWidth;
  final _beePositionXMultiplier = 0.01;
  final _beePositionYMultiplier = 0.5;
  final _beeImagePath = 'assets/images/bee.png';
  final _animationDuration = const Duration(seconds: 4);
  final _destinationOffset = const Offset(300, 300);

  late final AnimationController _controller =
      AnimationController(vsync: this, duration: _animationDuration)
        ..addStatusListener(
          (status) {
            if (status == AnimationStatus.completed) {
              _controller.reverse();
            } else if (status == AnimationStatus.dismissed) {
              _controller.forward();
            }
          },
        )
        ..forward();

  late final _animation = Tween<Offset>(
    begin: Offset.zero,
    end: _destinationOffset,
  ).animate(
    CurvedAnimation(parent: _controller, curve: Curves.bounceInOut),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: widget.constraints.maxHeight * _beePositionYMultiplier,
      left: widget.constraints.maxWidth * _beePositionXMultiplier,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (BuildContext context, Widget? child) {
          //print('inside animation: ${_animation.value}');
          return Transform.translate(offset: _animation.value, child: child);
        },
        child: Image.asset(
          _beeImagePath,
          height: _beeSize,
          width: _beeSize,
        ),
      ),
    );
  }
}
