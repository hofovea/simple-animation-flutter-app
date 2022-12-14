import 'package:flutter/material.dart';

class Bee extends StatefulWidget {
  final BoxConstraints constraints;

  const Bee({Key? key, required this.constraints}) : super(key: key);

  @override
  State<Bee> createState() => _BeeState();
}

class _BeeState extends State<Bee> with SingleTickerProviderStateMixin {
  late final beeSize = 0.2 * widget.constraints.maxWidth;
  final beePositionXMultiplier = 0;
  final beePositionYMultiplier = 0.45;
  final beeImagePath = 'assets/images/bee.png';

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Image.asset(
        beeImagePath,
        height: beeSize,
        width: beeSize,
      ),
    );
  }
}
