import 'package:flame_geom/int_position.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flame_geom/int_rect.dart';

void main() {
  test('overlaps', () {
    final r1 = IntRect.fromLTWH(0, 0, 2, 2);
    final r2 = IntRect.fromLTWH(1, 1, 2, 2);
    final r3 = IntRect.fromLTWH(2, 2, 2, 2);

    expect(r1.overlaps(r2), true);
    expect(r2.overlaps(r1), true);

    expect(r2.overlaps(r3), true);
    expect(r3.overlaps(r2), true);

    expect(r1.overlaps(r3), false);
    expect(r3.overlaps(r1), false);
  });
  test('union', () {
    final r1 = IntRect.fromLTWH(0, 0, 1, 2);
    final r2 = IntRect.fromLTWH(2, 2, 2, 1);

    final union = r1.union(r2);
    expect(union.x, 0);
    expect(union.y, 0);
    expect(union.w, 4);
    expect(union.h, 3);
  });
  test('contains', () {
    final r = IntRect.fromLTWH(0, 0, 2, 2);
    const p1 = const IntPosition(1, 1);
    const p2 = const IntPosition(3, 3);

    expect(r.contains(p1), true);
    expect(r.contains(p2), false);
  });
}
