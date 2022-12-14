import 'dart:math';

import 'package:flutter/material.dart';

class Flower extends StatelessWidget {
  final Point position;
  late final flowerSize = 0.3 * constraints.maxWidth;
  final _flowerImagePath = 'assets/images/flower.png';

  final BoxConstraints constraints;

  Flower({Key? key, required this.constraints, required this.position}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: position.y.toDouble(),
      left: position.x.toDouble(),
      child: Image.asset(
        _flowerImagePath,
        width: flowerSize,
        height: flowerSize,
      ),
    );
  }
}
