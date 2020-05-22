import 'dart:ui';

import 'overlapable.dart';
import 'renderable.dart';

/// This is an [Overlapable] composed of an arbitrary union of other overlapables.
///
/// If any of the overlapables overlaps, this overlaps.
class Bounds with Overlapable, Renderable {
  List<Overlapable> overlapables;

  /// Creates this with a list of [Overlapable].
  ///
  /// This shape represents the union of those shapes.
  Bounds(this.overlapables);

  /// Creates this from a single [Overlapable]
  Bounds.fromOverlapable(Overlapable overlapable)
      : overlapables = [overlapable];

  @override
  void render(Canvas c, Paint paint) {
    overlapables.forEach((e) {
      if (e is Renderable) {
        (e as Renderable).render(c, paint);
      }
    });
  }
}
