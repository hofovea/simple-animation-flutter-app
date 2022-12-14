import 'package:flutter/material.dart';

class Grass extends StatelessWidget {
  final grassHeightMultiplier = 0.3;

  final BoxConstraints constraints;

  const Grass({Key? key, required this.constraints}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      width: constraints.maxWidth,
      height: constraints.maxHeight * grassHeightMultiplier,
      bottom: 0,
      child: Container(
        color: Colors.green.shade800,
      ),
    );
  }
}
