import 'dart:ui';

import 'bounds.dart';
import 'int_rect.dart';
import 'overlapable.dart';
import 'renderable.dart';

/// This is an [Overlapable] composed of an arbitrary union of rects.
///
/// If any of the rects overlaps, this overlaps.
class IntBounds with Overlapable, Renderable {
  List<IntRect> rects;

  /// Creates this with a list of [IntRect].
  ///
  /// This shape represents the union of those rectangles.
  IntBounds(this.rects);

  /// Creates this from a single [IntRect]
  IntBounds.fromRect(IntRect rect) : rects = [rect];

  Bounds toBounds() {
    return Bounds(rects);
  }

  @override
  void render(Canvas c, Paint paint) {
    rects.forEach((rect) => rect.render(c, paint));
  }
}
