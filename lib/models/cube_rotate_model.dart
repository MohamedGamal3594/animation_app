import 'package:animation_app/views/cube_rotate_view.dart';
import 'package:flutter/material.dart';
import 'grid_item_model.dart';

class CubeRotateModel extends GridItemModel {
  CubeRotateModel({
    required this.controllers,
  });
  final List<AnimationController> controllers;
  @override
  Widget buildWidget() {
    return CubeRotateView(controllers: controllers);
  }
}
