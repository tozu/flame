import 'package:flame/extensions.dart';
import 'package:flame/game.dart';
import 'package:flame_tiled/src/renderable_layers/renderable_layer.dart';
import 'package:meta/meta.dart';
import 'package:tiled/tiled.dart';

@internal
class GroupLayer extends RenderableLayer<Group> {
  /// The child layers of this [Group] to be rendered recursively.
  ///
  /// NOTE: This is set externally instead of via constructor params because
  ///       there are cyclic dependencies when loading the renderable layers.
  late final List<RenderableLayer> children;

  GroupLayer(
    super.layer,
    super.parent,
    super.map,
    super.destTileSize,
  );

  @override
  void refreshCache() {
    for (final child in children) {
      child.refreshCache();
    }
  }

  @override
  void handleResize(Vector2 canvasSize) {
    for (final child in children) {
      child.handleResize(canvasSize);
    }
  }

  @override
  void render(Canvas canvas, Camera? camera) {
    for (final child in children) {
      child.render(canvas, camera);
    }
  }

  @override
  void update(double dt) {
    for (final child in children) {
      child.update(dt);
    }
  }
}
