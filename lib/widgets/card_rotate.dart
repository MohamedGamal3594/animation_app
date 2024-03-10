import 'dart:math';
import 'package:animation_app/widgets/item_builder.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

class CardRotate extends StatelessWidget {
  CardRotate({
    super.key,
    required this.color,
    required this.axis,
    required this.controller,
  });
  final AnimationController controller;
  final Tween<double> tween = Tween<double>(
    begin: 0.0,
    end: 2 * pi,
  );
  final Vector3 axis;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..rotate(axis, tween.evaluate(controller)),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: color,
            ),
            height: 100,
            width: 100,
          ),
        ),
      ],
    );
  }
}

class CardRotateBuilder extends ItemBuilder {
  CardRotateBuilder({
    required this.color,
    required this.axis,
    required this.controller,
  });
  final AnimationController controller;
  final Vector3 axis;
  final Color color;
  @override
  Widget buildWidget() {
    return CardRotate(
      color: color,
      axis: axis,
      controller: controller,
    );
  }
}
