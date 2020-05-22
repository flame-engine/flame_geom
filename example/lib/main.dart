import 'dart:ui';

import 'package:flame/game/game.dart';
import 'package:flame/position.dart';
import 'package:flame_geom/circle.dart';
import 'package:flame_geom/rectangle.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(MyGame().widget);

class MyGame extends Game {

  static Paint p1 = Paint()..color = const Color(0xFFFF00FF)..style = PaintingStyle.stroke;
  static Paint p2 = Paint()..color = const Color(0xFFFFFF00)..style = PaintingStyle.stroke;
  static Paint p3 = Paint()..color = const Color(0xFF00FFFF)..style = PaintingStyle.stroke..strokeWidth = 4.0;

  Size size;

  Circle unitCircle;
  Rectangle rectangle;
  List<Position> points;

  MyGame() {
    unitCircle = Circle(Position(10, 30), 100.0);
    rectangle = Rectangle.fromLTWH(-100, -100, 200, 200);
    points = rectangle.sides().expand((e) => unitCircle.intersectLineSegment(e)).toList();
  }

  @override
  void render(Canvas canvas) {
    canvas.translate(size.width / 2, size.height / 2);

    canvas.drawCircle(unitCircle.center.toOffset(), unitCircle.radius, p1);
    canvas.drawRect(rectangle.asRect(), p2);
    canvas.drawPoints(PointMode.points, points.map((p) => p.toOffset()).toList(), p3);
  }

  @override
  void update(double dt) {}

  @override
  void resize(Size size) {
    this.size = size;
  }
}
