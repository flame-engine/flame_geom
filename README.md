# flame_geom

Complement Flame with APIs for handling shapes and geometric operations.

## Overview

This package makes heavy use of Flame's `Position` class and includes several geometric structures:

* LineSegment: represents a finite line segment between two points in a 2D Euclidian space (or sometimes the whole line).
* Circle: represents a circle (or sometimes a circumference) in 2D Euclidian space.
* Rectangle: represents an axis-aligned rectangle in a 2D Euclidian space.
* Overlapable: generic interface for shapes that can overlap one another.

If working with integer precision, it might also be useful to take a look at some integer versions of these classes:

* IntPosition: similar to Position but for integers.
* IntRect: similar to Rectangle but for integers.
* IntBounds: similar to Overlapple but for integers.

