import 'package:animation_app/views/circle_rotate_view.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;
import 'grid_item_model.dart';

class CircleRotateModel extends GridItemModel {
  CircleRotateModel({this.axis, this.animation});
  Vector3? axis;
  Animation<double>? animation;
  @override
  Widget buildWidget() {
    return CircleRotateView(axis: axis!, animation: animation!);
  }
}
