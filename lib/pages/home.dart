import 'package:animation_app/widgets/animated_polygon.dart';
import 'package:animation_app/widgets/card_rotate.dart';
import 'package:animation_app/widgets/circle_rotate.dart';
import 'package:animation_app/widgets/colorful_circle.dart';
import 'package:animation_app/widgets/cube_rotate.dart';
import 'package:animation_app/widgets/hero_view.dart';
import 'package:animation_app/widgets/item_builder.dart';
import 'package:animation_app/widgets/zoom_view.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  // List of Items
  late List<ItemBuilder> items;

  // CardRotateComponents
  late AnimationController _cardController;

  // CircleRotateComponents
  late AnimationController _counterClockwiseRotationController;
  late AnimationController _flipController;

  //CubeRotateComponent
  late AnimationController _xController;
  late AnimationController _yController;
  late AnimationController _zController;

  // polygonComponent
  late AnimationController _sidesController;
  late AnimationController _radiusController;
  late AnimationController _rotationController;

  @override
  void initState() {
    super.initState();
    // CardSetUp
    _cardController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    // CircleSetUp
    _counterClockwiseRotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..forward();
    _flipController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    //CubeSetUp
    _xController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )
      ..reset()
      ..repeat();
    _yController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30),
    )
      ..reset()
      ..repeat();
    _zController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 40),
    )
      ..reset()
      ..repeat();

    // polygonSetUp
    _sidesController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
    _radiusController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);

    // Initailize items
    items = [
      CardRotateBuilder(
        color: Colors.red,
        axis: Vector3(1.0, 0, 0),
        controller: _cardController,
      ),
      CardRotateBuilder(
        color: Colors.green,
        axis: Vector3(0, 1.0, 0),
        controller: _cardController,
      ),
      CircleRotateBuilder(
        counterClockwiseRotationController: _counterClockwiseRotationController,
        flipController: _flipController,
      ),
      CubeRotateBuilder(
        xController: _xController,
        yController: _yController,
        zController: _zController,
      ),
      const HeroBuilder(),
      const ZoomBuilder(),
      const ColorfulCircleBuilder(),
      AnimatedPolygonBuilder(
        sideController: _sidesController,
        radiusController: _radiusController,
        rotationController: _rotationController,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return Center(
      child: AnimatedBuilder(
        animation: Listenable.merge([
          _cardController,
          _counterClockwiseRotationController,
          _flipController,
          _xController,
          _yController,
          _zController,
          _sidesController,
          _radiusController,
          _rotationController
        ]),
        builder: (context, child) {
          return GridView.builder(
            padding: const EdgeInsets.symmetric(vertical: 30),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: width < 500 ? 1 : 2,
              childAspectRatio: 1.7,
            ),
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              final item = items[index];
              return item.buildWidget();
            },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _cardController.dispose();
    _counterClockwiseRotationController.dispose();
    _flipController.dispose();
    _xController.dispose();
    _yController.dispose();
    _zController.dispose();
    _sidesController.dispose();
    _radiusController.dispose();
    _rotationController.dispose();
    super.dispose();
  }
}
