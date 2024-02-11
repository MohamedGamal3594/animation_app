import 'package:animation_app/views/hero_view.dart';
import 'package:flutter/material.dart';
import 'grid_item_model.dart';

class HeroModel extends GridItemModel {
  @override
  Widget buildWidget() {
    return const HeroView();
  }
}
