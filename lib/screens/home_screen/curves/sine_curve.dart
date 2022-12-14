import 'dart:math';

import 'package:flutter/animation.dart';

class SineCurve extends Curve {
  @override
  double transform(double t) => sin(t);
}
