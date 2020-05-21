import 'package:flame/position.dart';
import 'package:flame_geom/circle.dart';
import 'package:flame_geom/rectangle.dart';
import 'package:flutter/widgets.dart';

void main() {
  final unitCircle = Circle(Position(0, 0), 1.0);
  final rectangle = Rectangle.fromLTWH(-1, -1, 2, 2);
  final points = rectangle.sides().expand((e) => unitCircle.intersectLineSegment(e));
  print(points);

  runApp(Container(child: Text('Points: $points')));
}
