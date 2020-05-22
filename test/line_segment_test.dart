import 'package:flame/position.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flame_geom/line_segment.dart';

void main() {
  test('contains', () {
    final l = LineSegment.fromPoints(Position(0, 0), Position(1, 1));

    expect(l.contains(Position(0, 0)), true);
    expect(l.contains(Position(1, 1)), true);
    expect(l.contains(Position(0.5, 0.5)), true);
    expect(l.contains(Position(0.5, 0.3)), false);
    expect(l.contains(Position(2, 2)), false);
  });
  test('containsExtended', () {
    final l = LineSegment.fromPoints(Position(0, 0), Position(1, 1));

    expect(l.containsExtended(Position(0, 0)), true);
    expect(l.containsExtended(Position(1, 1)), true);
    expect(l.containsExtended(Position(0.5, 0.5)), true);
    expect(l.containsExtended(Position(0.5, 0.3)), false);
    expect(l.containsExtended(Position(2, 2)), true);
  });
}
