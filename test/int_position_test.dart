import 'package:flutter_test/flutter_test.dart';

import 'package:flame_geom/int_position.dart';

void main() {
  test('equality', () {
    const p = const IntPosition(1, 2);
    expect(p, const IntPosition(1, 2));
  });
  test('add', () {
    const p1 = const IntPosition(10, 20);
    expect(p1.add(1, 0), const IntPosition(11, 20));
  });
  test('minus', () {
    const p1 = const IntPosition(10, 20);
    expect(p1.minus(1, 0), const IntPosition(9, 20));
  });
  test('times', () {
    const p1 = const IntPosition(10, 20);
    expect(p1.times(2), const IntPosition(20, 40));
  });
  test('opposite', () {
    const p1 = const IntPosition(10, -5);
    expect(p1.opposite(), const IntPosition(-10, 5));
  });
}
