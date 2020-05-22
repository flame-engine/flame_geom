import 'dart:ui';

import 'package:flame/position.dart';
import 'package:flame_geom/int_rect.dart';
import 'package:flame_geom/line_segment.dart';
import 'package:flame_geom/rectangle.dart';

import 'circle.dart';
import 'int_position.dart';

class Renderer {
  Renderer._();

  static void renderCircle(Canvas canvas, Circle circle, Paint paint) {
    canvas.drawCircle(circle.center.toOffset(), circle.radius, paint);
  }

  static void renderRectangle(Canvas canvas, Rectangle rectangle, Paint paint) {
    canvas.drawRect(rectangle.asRect(), paint);
  }

  static void renderIntRect(Canvas canvas, IntRect intRect, Paint paint) {
    canvas.drawRect(intRect.asRect(), paint);
  }

  static void renderLineSegment(
    Canvas canvas,
    LineSegment lineSegment,
    Paint paint,
  ) {
    canvas.drawLine(
      lineSegment.p1.toOffset(),
      lineSegment.p2.toOffset(),
      paint,
    );
  }

  static void renderIntPosition(
    Canvas canvas,
    IntPosition intPosition,
    Paint paint,
  ) {
    renderPosition(canvas, intPosition.toPosition(), paint);
  }

  static void renderPosition(Canvas canvas, Position position, Paint paint) {
    renderPositions(canvas, [position], paint);
  }

  static void renderPositions(
    Canvas canvas,
    List<Position> positions,
    Paint paint,
  ) {
    if (positions.isNotEmpty) {
      canvas.drawPoints(
        PointMode.points,
        positions.map((e) => e.toOffset()).toList(),
        paint,
      );
    }
  }
}
