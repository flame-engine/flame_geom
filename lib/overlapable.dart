import 'bounds.dart';
import 'circle.dart';
import 'int_bounds.dart';
import 'int_rect.dart';
import 'rectangle.dart';

/// This represents shapes that can overlap one another.
///
/// They must implement the [overlaps] method to tell whether there are overlaps or not.
mixin Overlapable {
  /// Whether two [Overlapable] collide (overlaps) with one another.
  ///
  /// This should be transitive (a.overlaps(b) == b.overlaps(a)) (all implementations must comply).
  /// Some implementations of [Overlapable] might delegate this to others by swapping the parameter and callee.
  bool overlaps(Overlapable o) {
    return _Overlapables.overlap(this, o);
  }
}

/// This mock implementation always overlaps with anything.
///
/// Useful for edge cases in methods that return or receive [Overlapable] objects.
class CertainOverlap with Overlapable {}


/// Overlapables can be IntRect, Circle, Rectangle, IntBounds, Bounds
class _Overlapables {
  static final List<Type> _classes = [IntRect, IntBounds, Circle, Rectangle, Bounds];

  static Overlapable _normalize(Overlapable o) {
    if (o is IntRect) {
      return o.toRectangle();
    } else if (o is IntBounds) {
      return o.toBounds();
    } else {
      return o;
    }
  }

  static bool overlap(Overlapable o1, Overlapable o2) {
    if (!_classes.contains(o1.runtimeType)) {
      throw 'Unknown Overlapable type: ${o1.runtimeType}';
    }
    if (!_classes.contains(o2.runtimeType)) {
      throw 'Unknown Overlapable type: ${o2.runtimeType}';
    }

    final normalized = [o1, o2].map(_normalize).toList();
    normalized.sort((a, b) => _classes.indexOf(a.runtimeType) - _classes.indexOf(b.runtimeType));
    
    final no1 = normalized[0];
    final no2 = normalized[1];

    if (no1 is Circle && no2 is Circle) {
      return no1.overlapsCircle(no2);
    } else if (no1 is Circle && no2 is Rectangle) {
      return no2.overlapsCircle(no1);
    } else if (no1 is Circle && no2 is Bounds) {
      return no2.overlapables.any((o) => o.overlaps(no1));
    } else if (no1 is Rectangle && no2 is Rectangle) {
      return no1.overlapsRectangle(no2);
    } else if (no1 is Rectangle && no2 is Bounds) {
      return no2.overlapables.any((o) => o.overlaps(no1));
    } else if (no1 is Bounds && no2 is Bounds) {
      return no1.overlapables.any((o1) => no2.overlapables.any((o2) => o1.overlaps(o2)));
    } else {
      throw 'Unknown Overlapable';
    }

  }
}