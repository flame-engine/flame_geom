# flame_geom

[![Pub](https://img.shields.io/pub/v/flame_geom.svg?style=popout)](https://pub.dartlang.org/packages/flame_geom) ![Test](https://github.com/flame-engine/flame_geom/workflows/Build/badge.svg?branch=master&event=push) [![Discord](https://img.shields.io/discord/509714518008528896.svg)](https://discord.gg/pxrBmy4)

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

