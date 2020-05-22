import 'package:flutter_test/flutter_test.dart';

import 'package:flame_geom/rectangle.dart';

void main() {
  test('basis', () {
    final r = Rectangle.fromLTWH(2, 2, 3, 4);
    expect(r.x, 2);
    expect(r.y, 2);
    expect(r.w, 3);
    expect(r.h, 4);
    expect(r.left, 2);
    expect(r.top, 2);
    expect(r.right, 5);
    expect(r.bottom, 6);
  });
}
