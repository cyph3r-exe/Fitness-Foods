import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutteranimations1/src/components/components.dart';
import 'config.dart';

class BrickBreaker extends FlameGame {
  BrickBreaker() 
  : super(
    camera: CameraComponent.withFixedResolution(
      width: gameHeight, 
      height: gameWidth,
      ),
  );

  double get height => size.x;
  double get width => size.y;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    camera.viewfinder.anchor = Anchor.topLeft;

    world.add(PlayArea());
  }
}