import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

class CircleRotateView extends StatelessWidget {
  const CircleRotateView({
    super.key,
    required this.axis,
    required this.animation,
  });
  final double length = 120;
  final Vector3 axis;
  final Animation<double> animation;
  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()..rotate(axis, animation.value),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipPath(
            clipper: const HalfCircleClipper(side: CircleSide.left),
            child: Container(
              color: Colors.blue,
              width: length,
              height: length,
            ),
          ),
          ClipPath(
            clipper: const HalfCircleClipper(side: CircleSide.right),
            child: Container(
              color: Colors.yellow,
              width: length,
              height: length,
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
