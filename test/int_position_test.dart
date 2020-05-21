import 'package:flutter_test/flutter_test.dart';

import 'package:flame_geom/int_position.dart';

void main() {
  test('equality', () {
    final p = IntPosition(1, 2);
    expect(p, IntPosition(1, 2));
  });
  test('add', () {
    final p1 = IntPosition(10, 20);
    expect(p1.add(1, 0), IntPosition(11, 20));
  });
  test('minus', () {
    final p1 = IntPosition(10, 20);
    expect(p1.minus(1, 0), IntPosition(9, 20));
  });
  test('times', () {
    final p1 = IntPosition(10, 20);
    expect(p1.times(2), IntPosition(20, 40));
  });
  test('opposite', () {
    final p1 = IntPosition(10, -5);
    expect(p1.opposite(), IntPosition(-10, 5));
  });
}
