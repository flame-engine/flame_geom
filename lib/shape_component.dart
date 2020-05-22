import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/position.dart';
import 'package:flame_geom/renderable.dart';

import 'renderer.dart';

class ShapeComponent extends Component {

  Paint paint;
  List<Renderable> renderables = [];
  List<Position> positions = [];

  ShapeComponent(this.paint, { List<Renderable> renderables = const [], List<Position> positions = const [] }) {
    this.renderables.addAll(renderables);
    this.positions.addAll(positions);
  }

  ShapeComponent.fromRenderable(this.paint, Renderable r) {
    renderables.add(r);
  }

  ShapeComponent.fromPosition(this.paint, Position p) {
    positions.add(p);
  }

  ShapeComponent.fromRenderables(this.paint, List<Renderable> rs) {
    renderables.addAll(rs);
  }

  ShapeComponent.fromPositions(this.paint, List<Position> ps) {
    positions.addAll(ps);
  }

  void addRenderable(Renderable r) {
    renderables.add(r);
  }

  void addPosition(Position p) {
    positions.add(p);
  }

  void clear() {
    renderables.clear();
    positions.clear();
  }

  @override
  void render(Canvas c) {
    renderables.forEach((r) => r.render(c, paint));
    Renderer.renderPositions(c, positions, paint);
  }

  @override
  void update(double dt) {}
}
