import 'package:flutter_test/flutter_test.dart';

import 'package:flame_geom/int_rect.dart';
import 'package:flame_geom/int_bounds.dart';

void main() {
  test('simple overlaps', () {
    final i1 = IntBounds([IntRect.fromLTWH(0, 0, 1, 1)]);
    final i2 = IntBounds([IntRect.fromLTWH(-10, -2, 20, 4)]);
    final i3 = IntBounds([IntRect.fromLTWH(5, 0, 1, 1)]);

    expect(i1.overlaps(i2), true);
    expect(i2.overlaps(i1), true);

    expect(i2.overlaps(i3), true);
    expect(i3.overlaps(i2), true);

    expect(i1.overlaps(i3), false);
    expect(i3.overlaps(i1), false);
  });

  test('complex overlaps', () {
    final i1 =
        IntBounds([IntRect.fromLTWH(0, 0, 1, 1), IntRect.fromLTWH(5, 0, 1, 1)]);
    final i2 = IntBounds([IntRect.fromLTWH(-10, -2, 20, 4)]);
    final i3 = IntBounds([IntRect.fromLTWH(3, 0, 1, 1)]);

    expect(i1.overlaps(i2), true);
    expect(i2.overlaps(i1), true);

    expect(i1.overlaps(i3), false);
    expect(i3.overlaps(i1), false);
  });
}
