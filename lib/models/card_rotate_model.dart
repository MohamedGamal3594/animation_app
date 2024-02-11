import 'package:animation_app/views/card_rotate_view.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;
import 'grid_item_model.dart';

class CardRotateModel extends GridItemModel {
  CardRotateModel({
    required this.color,
    required this.axis,
    required this.controller,
  });
  final AnimationController controller;
  final Vector3 axis;
  final Color color;
  @override
  Widget buildWidget() {
    return CardRotateView(
      color: color,
      axis: axis,
      controller: controller,
    );
  }
}
