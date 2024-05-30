import 'dart:async';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutteranimations1/src/components/components.dart';
import 'config.dart';
import 'dart:math' as math;

class BrickBreaker extends FlameGame {
  BrickBreaker() 
  : super(
    camera: CameraComponent.withFixedResolution(
      width: gameHeight, 
      height: gameWidth,
      ),
  );

  final rand = math.Random();
  double get height => size.x;
  double get width => size.y;

  @override
  Future<void> onLoad() async {
    super.onLoad();
    camera.viewfinder.anchor = Anchor.topLeft;

    world.add(PlayArea());


    world.add(Ball(
      velocity: Vector2((rand.nextDouble() - 0.5) * width, height * 0.2)
        .normalized()
        ..scale(height / 4),
      position: size / 2, 
      radius: ballRadius));

      debugMode = true;
  }
}