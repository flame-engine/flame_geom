import 'package:flame/position.dart';
import 'package:flame_geom/line_segment.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flame_geom/circle.dart';

void main() {
  test('copy contructor', () {
    final circle = Circle(Position(0, 0), 1.0);
    final copy = Circle.fromCircle(circle);
    copy.radius = 10.0;
    expect(copy.radius, 10.0);
    expect(circle.radius, 1.0);
  });
  test('containsPoint', () {
    final circle = Circle(Position(0, 0), 2.0);

    final inside = Position(1.0, 1.0);
    expect(circle.containsPoint(inside), true);

    final outside = Position(3.0, 1.0);
    expect(circle.containsPoint(outside), false);
  });
  test('containsLineSegment', () {
    final circle = Circle(Position(0, 0), 2.0);

    final inside = LineSegment.fromPoints(Position(0, 0), Position(1, 1));
    expect(circle.containsLineSegment(inside), true);

    final outside = LineSegment.fromPoints(Position(0, 3), Position(1, 3));
    expect(circle.containsLineSegment(outside), false);
  });
  test('overlapsLineSegment', () {
    final circle = Circle(Position(0, 0), 2.0);

    final notLongEnough =
        LineSegment.fromPoints(Position(0, 0), Position(1, 1));
    expect(circle.overlapsLineSegment(notLongEnough), false);

    final longer = LineSegment.fromPoints(Position(0, 0), Position(3, 3));
    expect(circle.overlapsLineSegment(longer), true);
  });
  test('intersectsLine', () {
    final circle = Circle(Position(0, 0), 2.0);

    final vertical = LineSegment.fromPoints(Position(0, 0), Position(0, 1));
    final points = circle.intersectsLine(vertical);
    expect(points.any((e) => e.x == 0.0 && e.y == 2.0), true);
    expect(points.any((e) => e.x == 0.0 && e.y == -2.0), true);
  });
}
