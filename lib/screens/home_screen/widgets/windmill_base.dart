import 'package:flutter/material.dart';


class WindmillBase extends StatelessWidget {
  final _windmillBaseHeightMultiplier = 0.7;
  final _windmillBaseWightMultiplier = 0.15;
  final _windmillBasePositionXMultiplier = 0.4;
  final _windmillBasePositionYMultiplier = 0.12;

  final BoxConstraints constraints;
  const WindmillBase({Key? key, required this.constraints}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: constraints.maxWidth * _windmillBasePositionXMultiplier,
      bottom: constraints.maxHeight * _windmillBasePositionYMultiplier,
      width: constraints.maxWidth * _windmillBaseWightMultiplier,
      height: constraints.maxHeight * _windmillBaseHeightMultiplier,
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.brown,
        ),
        alignment: Alignment.center,
      ),
    );
  }
}
