import 'dart:math';

import 'package:flutter/material.dart';

class Flower extends StatelessWidget {
  final _numberOfFlowers = 6;
  late final _flowerSize = 0.3 * constraints.maxWidth;
  final _minFlowerPositionXMultiplier = 0;
  final _maxFlowerPositionXMultiplier = 0.78;
  final _minFlowerPositionYMultiplier = 0.01;
  final _maxFlowerPositionYMultiplier = 0.24;
  final _flowerImagePath = 'assets/images/flower.png';
  late final _flowerPositionList = _generatePositionList();

  List<Point> get positions => _flowerPositionList;

  final BoxConstraints constraints;

  Flower({Key? key, required this.constraints}) : super(key: key);

  List<Point> _generatePositionList() {
    final positions = <Point>[];
    for (int i = 0; i < _numberOfFlowers; i++) {
      positions.add(Point(
          constraints.maxWidth * Random().nextDouble() * _maxFlowerPositionXMultiplier -
              _minFlowerPositionXMultiplier,
          constraints.maxHeight * Random().nextDouble() * _maxFlowerPositionYMultiplier -
              _minFlowerPositionYMultiplier));
    }
    return positions;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: _flowerPositionList
          .map(
            (e) => Positioned(
              bottom: e.y.toDouble(),
              left: e.x.toDouble(),
              child: Image.asset(
                _flowerImagePath,
                width: _flowerSize,
                height: _flowerSize,
              ),
            ),
          )
          .toList(),
    );
  }
}
