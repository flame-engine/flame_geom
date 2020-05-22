import 'dart:math';

import 'package:flame/position.dart';
import 'package:flame_geom/bounds.dart';
import 'package:flame_geom/circle.dart';
import 'package:flame_geom/int_bounds.dart';
import 'package:flame_geom/int_rect.dart';
import 'package:flame_geom/rectangle.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('two int rects', () {
    final r1 = IntRect.fromLTWH(0, 0, 1, 2);

    final r2 = IntRect.fromLTWH(0, 1, 2, 1);
    final r3 = IntRect.fromLTWH(4, 4, 1, 1);

    expect(r1.overlaps(r2), true);
    expect(r1.overlaps(r3), false);
  });
  test('int rect and circle', () {
    final r1 = IntRect.fromLTWH(0, 0, 1, 2);

    final c1 = Circle(Position(3, 3), 1);
    final c2 = Circle(Position(0, 0), 1);

    expect(r1.overlaps(c1), false);
    expect(r1.overlaps(c2), true);
  });
  test('int rect and rectangle', () {
    final r1 = IntRect.fromLTWH(0, 0, 1, 2);

    final r2 = Rectangle.fromLTWH(0, 1, 2, 1);
    final r3 = Rectangle.fromLTWH(4, 4, 1, 1);

    expect(r1.overlaps(r2), true);
    expect(r1.overlaps(r3), false);
  });
  test('int rect and int bounds', () {
    final r1 = IntRect.fromLTWH(0, 0, 1, 2);

    final r2 = IntRect.fromLTWH(0, 1, 2, 1);
    final r3 = IntRect.fromLTWH(4, 4, 1, 1);
    final b = IntBounds([r2, r3]);

    expect(r1.overlaps(b), true);
    expect(b.overlaps(r1), true);
  });
  test('int rect and bounds', () {
    final r1 = IntRect.fromLTWH(0, 0, 1, 2);

    final r2 = Rectangle.fromLTWH(2, 2, 2, 1);
    final c1 = Circle(Position(10, 10), 2);
    final c2 = Circle(Position(2, 3), sqrt(2) + 0.1);

    final b1 = Bounds([r2, c1]);
    final b2 = Bounds([r2, c2]);

    expect(r1.overlaps(b1), false);
    expect(b1.overlaps(r1), false);

    expect(r1.overlaps(b2), true);
    expect(b2.overlaps(r1), true);
  });
  test('two circles', () {
    final c1 = Circle(Position(10, 10), 2);
    final c2 = Circle(Position(2, 3), sqrt(2) + 0.1);
    final c3 = Circle(Position(1, 1), 2);

    expect(c1.overlaps(c2), false);
    expect(c2.overlaps(c1), false);

    expect(c1.overlaps(c3), false);
    expect(c3.overlaps(c1), false);

    expect(c2.overlaps(c3), true);
    expect(c3.overlaps(c2), true);
  });
  test('circle and rectangle', () {
    final r1 = Rectangle.fromLTWH(0, 0, 1, 2);

    final c1 = Circle(Position(3, 3), 1);
    final c2 = Circle(Position(0, 0), 1);

    expect(r1.overlaps(c1), false);
    expect(r1.overlaps(c2), true);
  });
  test('circle and int bounds', () {
    final c = Circle(Position(1, 1), 2);

    final r1 = IntRect.fromLTWH(0, 1, 2, 1);
    final r2 = IntRect.fromLTWH(4, 4, 1, 1);
    final b = IntBounds([r1, r2]);

    expect(c.overlaps(b), true);
    expect(b.overlaps(c), true);
  });
  test('circle and bounds', () {
    final c1 = Circle(Position(1, 1), 2);

    final r = IntRect.fromLTWH(0, 1, 2, 1);
    final c2 = Circle(Position(4, 4), 1);
    final b = Bounds([r, c2]);

    expect(c1.overlaps(b), true);
    expect(b.overlaps(c1), true);
  });
  test('two rectangles', () {
    final r1 = Rectangle.fromLTWH(0, 0, 1, 2);

    final r2 = Rectangle.fromLTWH(0, 1, 2, 1);
    final r3 = Rectangle.fromLTWH(4, 4, 1, 1);

    expect(r1.overlaps(r2), true);
    expect(r1.overlaps(r3), false);
  });
  test('rectangles and int bounds', () {
    final r1 = Rectangle.fromLTWH(0, 0, 1, 2);

    final r2 = IntRect.fromLTWH(0, 1, 2, 1);
    final r3 = IntRect.fromLTWH(4, 4, 1, 1);
    final b = IntBounds([r2, r3]);

    expect(r1.overlaps(b), true);
    expect(b.overlaps(r1), true);
  });
  test('rectangles and bounds', () {
    final r1 = Rectangle.fromLTWH(0, 0, 1, 2);

    final r2 = Rectangle.fromLTWH(2, 2, 2, 1);
    final c1 = Circle(Position(10, 10), 2);
    final c2 = Circle(Position(2, 3), sqrt(2) + 0.1);

    final b1 = Bounds([r2, c1]);
    final b2 = Bounds([r2, c2]);

    expect(r1.overlaps(b1), false);
    expect(b1.overlaps(r1), false);

    expect(r1.overlaps(b2), true);
    expect(b2.overlaps(r1), true);
  });
  test('two int bounds', () {
    final r1 = IntRect.fromLTWH(100, 101, 4, 7);
    final r2 = IntRect.fromLTWH(3, 3, 2, 2);
    final b1 = IntBounds([r1, r2]);

    final r3 = IntRect.fromLTWH(0, 1, 2, 1);
    final r4 = IntRect.fromLTWH(4, 4, 1, 1);
    final b2 = IntBounds([r3, r4]);

    expect(b1.overlaps(b2), true);
    expect(b2.overlaps(b1), true);
  });
  test('int bounds and bounds', () {
    final r1 = IntRect.fromLTWH(100, 101, 4, 7);
    final r2 = IntRect.fromLTWH(3, 3, 2, 2);
    final b1 = IntBounds([r1, r2]);

    final r3 = Rectangle.fromLTWH(2, 2, 2, 1);
    final c = Circle(Position(2, 3), sqrt(2) + 0.1);
    final b2 = Bounds([r3, c]);

    expect(b1.overlaps(b2), true);
    expect(b2.overlaps(b1), true);
  });
  test('two bounds', () {
    final r = Rectangle.fromLTWH(2, 2, 2, 1);
    final c1 = Circle(Position(10, 10), 2);
    final c2 = Circle(Position(2, 3), sqrt(2) + 0.1);

    final b1 = Bounds([r, c1]);
    final b2 = Bounds([r, c2]);

    expect(b1.overlaps(b2), true);
    expect(b2.overlaps(b1), true);
  });
}
