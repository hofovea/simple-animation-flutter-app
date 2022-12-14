import 'package:flutter/material.dart';
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
                Flower(constraints: constraints),
                Sun(constraints: constraints),
                Cloud(constraints: constraints),
                Bird(constraints: constraints),
                WindmillCross(constraints: constraints),
              ],
            ),
          );
        },
      ),
    );
  }
}
