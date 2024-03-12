import 'dart:math' show pi, cos, sin;
import 'package:animation_app/widgets/item_builder.dart';
import 'package:flutter/material.dart';

class AnimatedPolygon extends StatelessWidget {
  AnimatedPolygon(
      {super.key,
      required this.sideController,
      required this.radiusController,
      required this.rotationController});
  final AnimationController sideController;
  final AnimationController radiusController;
  final AnimationController rotationController;
  final Tween<int> sidesTween = IntTween(
    begin: 3,
    end: 10,
  );
  final Tween<double> radiusTween = Tween<double>(
    begin: 20,
    end: 120,
  );
  final Tween<double> rotationTween = Tween<double>(
    begin: 0,
    end: 2 * pi,
  );
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..rotateX(rotationTween.evaluate(
              CurvedAnimation(
                  parent: rotationController, curve: Curves.bounceInOut),
            ))
            ..rotateY(rotationTween.evaluate(
              CurvedAnimation(
                  parent: rotationController, curve: Curves.bounceInOut),
            ))
            ..rotateZ(rotationTween.evaluate(
              CurvedAnimation(
                  parent: rotationController, curve: Curves.bounceInOut),
            )),
          child: CustomPaint(
            painter: PolygonPainter(sides: sidesTween.evaluate(sideController)),
            child: SizedBox(
              width: radiusTween.evaluate(CurvedAnimation(
                parent: radiusController,
                curve: Curves.bounceInOut,
              )),
              height: radiusTween.evaluate(CurvedAnimation(
                parent: radiusController,
                curve: Curves.bounceInOut,
              )),
            ),
          ),
        )
      ],
    );
  }
}

class PolygonPainter extends CustomPainter {
  final int sides;

  PolygonPainter({required this.sides});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3;

    final path = Path();
    final center = Offset(size.width / 2, size.height / 2);
    final angle = (2 * pi) / sides;
    final angles = List.generate(sides, (index) => index * angle);
    final radius = size.width / 2;

    path.moveTo(
      center.dx + radius * cos(0),
      center.dy + radius * sin(0),
    );
    for (final angle in angles) {
      path.lineTo(
        center.dx + radius * cos(angle),
        center.dy + radius * sin(angle),
      );
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate is PolygonPainter && oldDelegate.sides != sides;
  }
}

class AnimatedPolygonBuilder extends ItemBuilder {
  const AnimatedPolygonBuilder({
    required this.radiusController,
    required this.sideController,
    required this.rotationController,
  });
  final AnimationController sideController;
  final AnimationController radiusController;
  final AnimationController rotationController;
  @override
  Widget buildWidget() {
    return AnimatedPolygon(
      sideController: sideController,
      radiusController: radiusController,
      rotationController: rotationController,
    );
  }
}
