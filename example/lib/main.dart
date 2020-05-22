import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flame/position.dart';
import 'package:flame_geom/circle.dart';
import 'package:flame_geom/bounds.dart';
import 'package:flame_geom/shape_component.dart';
import 'package:flame_geom/rectangle.dart';
import 'package:flutter/material.dart' show Colors;
import 'package:flutter/widgets.dart' show runApp;

void main() => runApp(MyGame().widget);

class MyGame extends BaseGame {
  static Paint p1 = Paint()
    ..color = const Color(0xFFFF00FF)
    ..style = PaintingStyle.stroke;
  static Paint p2 = Paint()
    ..color = const Color(0xFFFFFF00)
    ..style = PaintingStyle.stroke;
  static Paint p3 = Paint()
    ..color = const Color(0xFF00FFFF)
    ..style = PaintingStyle.stroke
    ..strokeWidth = 4.0;

  int setup = 0;

  MyGame() {
    setup0();
  }

  void setup0() {
    final unitCircle = Circle(Position(10, 30), 100.0);
    final rectangle = Rectangle.fromLTWH(-100, -100, 200, 200);
    final points = rectangle
        .sides()
        .expand((e) => unitCircle.intersectLineSegment(e))
        .toList();

    components.clear();
    add(ShapeComponent.fromRenderable(p1, unitCircle));
    add(ShapeComponent.fromRenderable(p2, rectangle));
    add(ShapeComponent.fromPositions(p3, points));
  }

  void setup1() {
    final bounds = Bounds([
      Circle(Position(10, 30), 100.0),
      Circle(Position(40, -10), 70.0),
      Circle(Position(-20, 100), 22.0),
    ]);
    final rectangle = Rectangle.fromLTWH(-120, -150, 270, 120);

    final overlap = bounds.overlaps(rectangle);
    final paint = Paint()..color = overlap ? Colors.green : Colors.red;

    components.clear();
    add(ShapeComponent.fromRenderable(p1, bounds));
    add(ShapeComponent.fromRenderable(p2, rectangle));
    add(ShapeComponent.fromRenderable(paint, Rectangle.fromLTWH(0, 0, 10, 10)));
  }

  void setup2() {
    final bounds = Bounds([
      Circle(Position(190, 30), 100.0),
      Circle(Position(200, -10), 70.0),
      Circle(Position(120, 100), 22.0),
    ]);
    final rectangle = Rectangle.fromLTWH(-230, -150, 270, 120);

    final overlap = bounds.overlaps(rectangle);
    final paint = Paint()..color = overlap ? Colors.green : Colors.red;

    components.clear();
    add(ShapeComponent.fromRenderable(p1, bounds));
    add(ShapeComponent.fromRenderable(p2, rectangle));
    add(ShapeComponent.fromRenderable(paint, Rectangle.fromLTWH(0, 0, 10, 10)));
  }

  @override
  void render(Canvas canvas) {
    canvas.translate(size.width / 2, size.height / 2);
    super.render(canvas);
  }

  @override
  void onTap(int pointerId) {
    setup = (setup + 1) % 3;
    if (setup == 0) {
      setup0();
    } else if (setup == 1) {
      setup1();
    } else if (setup == 2) {
      setup2();
    }
  }
}
