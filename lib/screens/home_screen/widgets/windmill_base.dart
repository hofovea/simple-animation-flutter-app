import 'package:flutter/material.dart';


class WindmillBase extends StatelessWidget {
  final windmillBaseHeightMultiplier = 0.7;
  final windmillBaseWightMultiplier = 0.15;
  final windmillBasePositionXMultiplier = 0.4;
  final windmillBasePositionYMultiplier = 0.12;

  final BoxConstraints constraints;
  const WindmillBase({Key? key, required this.constraints}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: constraints.maxWidth * windmillBasePositionXMultiplier,
      bottom: constraints.maxHeight * windmillBasePositionYMultiplier,
      width: constraints.maxWidth * windmillBaseWightMultiplier,
      height: constraints.maxHeight * windmillBaseHeightMultiplier,
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
