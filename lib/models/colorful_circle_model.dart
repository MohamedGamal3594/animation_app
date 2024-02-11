import 'package:animation_app/models/grid_item_model.dart';
import 'package:animation_app/views/colorful_circle_view.dart';
import 'package:flutter/material.dart';

class ColorfulCircleModel extends GridItemModel {
  @override
  Widget buildWidget() {
    return const ColorfulCircleView();
  }
}
