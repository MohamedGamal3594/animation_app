import 'package:animation_app/models/card_rotate_model.dart';
import 'package:animation_app/models/circle_rotate_model.dart';
import 'package:animation_app/models/colorful_circle_model.dart';
import 'package:animation_app/models/cube_rotate_model.dart';
import 'package:animation_app/models/grid_item_model.dart';
import 'package:animation_app/models/hero_model.dart';
import 'package:animation_app/models/zoom_model.dart';

import 'package:flutter/material.dart';
import 'dart:math' show pi;

import 'package:vector_math/vector_math_64.dart' show Vector3;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const id = 'Home';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  // List of Items
  late List<GridItemModel> items;

  // CardRotateComponents
  late AnimationController _cardController;

  // CircleRotateComponents
  var doFlip = false;
  late AnimationController _counterClockwiseRotationController;
  late AnimationController _flipController;
  late Animation<double> _counterClockwiseRotationAnimation;
  late Animation<double> _flipAnimation;

  //CubeRotateComponent
  late AnimationController _xController;
  late AnimationController _yController;
  late AnimationController _zController;

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
    _counterClockwiseRotationAnimation = Tween<double>(
      begin: 0,
      end: -(pi),
    ).animate(CurvedAnimation(
      parent: _counterClockwiseRotationController,
      curve: Curves.bounceOut,
    ));
    _flipController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _flipAnimation = Tween<double>(
      begin: 0,
      end: pi,
    ).animate(CurvedAnimation(
      parent: _flipController,
      curve: Curves.bounceOut,
    ));

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

    // Initailize items
    items = [
      CardRotateModel(
        color: Colors.red,
        axis: Vector3(1.0, 0, 0),
        controller: _cardController,
      ),
      CardRotateModel(
        color: Colors.green,
        axis: Vector3(0, 1.0, 0),
        controller: _cardController,
      ),
      CardRotateModel(
        color: Colors.white,
        axis: Vector3(0, 0, 1.0),
        controller: _cardController,
      ),
      CircleRotateModel(),
      CubeRotateModel(
        controllers: [
          _xController,
          _yController,
          _zController,
        ],
      ),
      HeroModel(),
      ZoomModel(),
      ColorfulCircleModel(),
    ];

    // status listeners

    // CircleRotateListener
    _counterClockwiseRotationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _flipAnimation = Tween<double>(
          begin: _counterClockwiseRotationAnimation.value,
          end: _counterClockwiseRotationAnimation.value - (pi),
        ).animate(CurvedAnimation(
          parent: _flipController,
          curve: Curves.bounceOut,
        ));
        doFlip = true;
        _flipController
          ..reset()
          ..forward();
      }
    });
    _flipController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _counterClockwiseRotationAnimation = Tween<double>(
          begin: _flipAnimation.value,
          end: _flipAnimation.value + pi,
        ).animate(CurvedAnimation(
          parent: _counterClockwiseRotationController,
          curve: Curves.bounceOut,
        ));
        doFlip = false;
        _counterClockwiseRotationController
          ..reset()
          ..forward();
      }
    });
  }

  @override
  void dispose() {
    // CardRotateDispose
    _cardController.dispose();
    // CircleRotateDispose
    _counterClockwiseRotationController.dispose();
    _flipController.dispose();
    //CubeRotateDispose
    _xController.dispose();
    _yController.dispose();
    _zController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animations'),
        centerTitle: true,
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: Listenable.merge([
            _cardController,
            _counterClockwiseRotationController,
            _flipController,
            _xController,
            _yController,
            _zController,
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
                if (items[index] is CircleRotateModel) {
                  final item = items[index] as CircleRotateModel;
                  final Vector3 axis;
                  final Animation<double> animation;

                  if (doFlip) {
                    axis = Vector3(0, 1.0, 0);
                    animation = _flipAnimation;
                  } else {
                    axis = Vector3(0, 0, 1.0);
                    animation = _counterClockwiseRotationAnimation;
                  }

                  item.axis = axis;
                  item.animation = animation;
                  return item.buildWidget();
                }
                final item = items[index];
                return item.buildWidget();
              },
            );
          },
        ),
      ),
    );
  }
}
