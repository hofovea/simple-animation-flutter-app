import 'dart:math';

import 'package:flutter/material.dart';
import 'package:simple_animation_flutter_app/screens/home_screen/widgets/bee.dart';
import 'package:simple_animation_flutter_app/screens/home_screen/widgets/bird.dart';
import 'package:simple_animation_flutter_app/screens/home_screen/widgets/cloud.dart';
import 'package:simple_animation_flutter_app/screens/home_screen/widgets/flower.dart';
import 'package:simple_animation_flutter_app/screens/home_screen/widgets/grass.dart';
import 'package:simple_animation_flutter_app/screens/home_screen/widgets/sun.dart';
import 'package:simple_animation_flutter_app/screens/home_screen/widgets/windmill_cross.dart';
import 'package:simple_animation_flutter_app/screens/home_screen/widgets/windmill_base.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Container(
            color: Colors.blue,
            child: Stack(
              children: [
                Grass(constraints: constraints),
                WindmillBase(constraints: constraints),
                Flower(
                  constraints: constraints,
                  position: Point(constraints.maxWidth * 0.05, constraints.maxHeight * 0.85),
                ),
                Flower(
                  constraints: constraints,
                  position: Point(constraints.maxWidth * 0.2, constraints.maxHeight * 0.7),
                ),
                Flower(
                  constraints: constraints,
                  position: Point(constraints.maxWidth * 0.45, constraints.maxHeight * 0.75),
                ),
                Flower(
                  constraints: constraints,
                  position: Point(constraints.maxWidth * 0.6, constraints.maxHeight * 0.8),
                ),
                Flower(
                  constraints: constraints,
                  position: Point(constraints.maxWidth * 0.8, constraints.maxHeight * 0.8),
                ),
                Sun(constraints: constraints),
                Cloud(constraints: constraints),
                WindmillCross(constraints: constraints),
                Bird(constraints: constraints),
                Bee(constraints: constraints)
              ],
            ),
          );
        },
      ),
    );
  }
}
