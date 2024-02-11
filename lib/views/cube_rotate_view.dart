import 'dart:math';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

class CubeRotateView extends StatelessWidget {
  CubeRotateView({
    super.key,
    required this.controllers,
  });
  final double length = 80;
  final Tween<double> tween = Tween<double>(
    begin: 0,
    end: pi * 2,
  );
  final List<AnimationController> controllers;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..rotateX(tween.evaluate(controllers[0]))
            ..rotateY(tween.evaluate(controllers[1]))
            ..rotateZ(tween.evaluate(controllers[2])),
          child: Stack(
            children: [
              // front
              Container(
                color: Colors.green,
                height: length,
                width: length,
              ),
              // top side
              Transform(
                alignment: Alignment.topCenter,
                transform: Matrix4.identity()..rotateX(-(pi / 2)),
                child: Container(
                  color: Colors.orange,
                  height: length,
                  width: length,
                ),
              ),
              //left side
              Transform(
                alignment: Alignment.centerLeft,
                transform: Matrix4.identity()..rotateY(pi / 2),
                child: Container(
                  color: Colors.red,
                  height: length,
                  width: length,
                ),
              ),
              //right side
              Transform(
                alignment: Alignment.centerRight,
                transform: Matrix4.identity()..rotateY(-(pi / 2)),
                child: Container(
                  color: Colors.blue,
                  height: length,
                  width: length,
                ),
              ),
              //back
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..translate(Vector3(0, 0, -length)),
                child: Container(
                  color: Colors.purple,
                  height: length,
                  width: length,
                ),
              ),
              // top side
              Transform(
                alignment: Alignment.bottomCenter,
                transform: Matrix4.identity()..rotateX(pi / 2),
                child: Container(
                  color: Colors.brown,
                  height: length,
                  width: length,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
