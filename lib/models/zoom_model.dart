import 'package:animation_app/models/grid_item_model.dart';
import 'package:animation_app/views/zoom_view.dart';
import 'package:flutter/material.dart';

class ZoomModel extends GridItemModel {
  @override
  Widget buildWidget() {
    return const ZoomView();
  }
}
