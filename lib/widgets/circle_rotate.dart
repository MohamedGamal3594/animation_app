import 'dart:math' show pi;
import 'package:animation_app/widgets/item_builder.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

class CircleRotate extends StatefulWidget {
  const CircleRotate({
    super.key,
    required this.counterClockwiseRotationController,
    required this.flipController,
  });
  final AnimationController counterClockwiseRotationController;
  final AnimationController flipController;

  @override
  State<CircleRotate> createState() => _CircleRotateState();
}

class _CircleRotateState extends State<CircleRotate> {
  final double _length = 120;
  var _doFlip = false;
  late Animation<double> _counterClockwiseRotationAnimation;
  late Animation<double> _flipAnimation;

  @override
  void initState() {
    _counterClockwiseRotationAnimation = Tween<double>(
      begin: 0,
      end: -(pi),
    ).animate(CurvedAnimation(
      parent: widget.counterClockwiseRotationController,
      curve: Curves.bounceOut,
    ));
    _flipAnimation = Tween<double>(
      begin: 0,
      end: pi,
    ).animate(CurvedAnimation(
      parent: widget.flipController,
      curve: Curves.bounceOut,
    ));

    widget.counterClockwiseRotationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _flipAnimation = Tween<double>(
          begin: _counterClockwiseRotationAnimation.value,
          end: _counterClockwiseRotationAnimation.value - (pi),
        ).animate(CurvedAnimation(
          parent: widget.flipController,
          curve: Curves.bounceOut,
        ));
        _doFlip = true;
        widget.flipController
          ..reset()
          ..forward();
      }
    });

    widget.flipController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _counterClockwiseRotationAnimation = Tween<double>(
          begin: _flipAnimation.value,
          end: _flipAnimation.value + pi,
        ).animate(CurvedAnimation(
          parent: widget.counterClockwiseRotationController,
          curve: Curves.bounceOut,
        ));
        _doFlip = false;
        widget.counterClockwiseRotationController
          ..reset()
          ..forward();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..rotate(
          _doFlip ? Vector3(0, 1.0, 0) : Vector3(0, 0, 1.0),
          _doFlip
              ? _flipAnimation.value
              : _counterClockwiseRotationAnimation.value,
        ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipPath(
            clipper: const HalfCircleClipper(side: CircleSide.left),
            child: Container(
              color: Colors.blue,
              width: _length,
              height: _length,
            ),
          ),
          ClipPath(
            clipper: const HalfCircleClipper(side: CircleSide.right),
            child: Container(
              color: Colors.yellow,
              width: _length,
              height: _length,
            ),
          ),
        ],
      ),
    );
  }
}

enum CircleSide {
  left,
  right,
}

extension ToPath on CircleSide {
  Path toPath(Size size) {
    final path = Path();
    late Offset offset;
    late bool clockwise;
    switch (this) {
      case CircleSide.left:
        path.moveTo(size.width, 0);
        offset = Offset(size.width, size.height);
        clockwise = false;
        break;
      case CircleSide.right:
        offset = Offset(0, size.height);
        clockwise = true;
        break;
    }
    path.arcToPoint(
      offset,
      radius: Radius.elliptical(size.width / 2, size.height / 2),
      clockwise: clockwise,
    );
    path.close();
    return path;
  }
}

class HalfCircleClipper extends CustomClipper<Path> {
  const HalfCircleClipper({required this.side});
  final CircleSide side;

  @override
  Path getClip(Size size) => side.toPath(size);

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class CircleRotateBuilder extends ItemBuilder {
  CircleRotateBuilder({
    required this.counterClockwiseRotationController,
    required this.flipController,
  });
  final AnimationController counterClockwiseRotationController;
  final AnimationController flipController;
  @override
  Widget buildWidget() {
    return CircleRotate(
      counterClockwiseRotationController: counterClockwiseRotationController,
      flipController: flipController,
    );
  }
}
