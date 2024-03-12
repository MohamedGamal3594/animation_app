import 'package:animation_app/widgets/item_builder.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

Color getRandomColor() => Color(
      0xFF000000 + math.Random().nextInt(0xFFFFFF),
    );

class ColorfulCircle extends StatefulWidget {
  const ColorfulCircle({super.key});

  @override
  State<ColorfulCircle> createState() => _ColorfulCircleState();
}

class _ColorfulCircleState extends State<ColorfulCircle> {
  final double length = 120;
  var _color = getRandomColor();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TweenAnimationBuilder<Color?>(
          duration: const Duration(seconds: 1),
          tween: ColorTween(
            begin: getRandomColor(),
            end: _color,
          ),
          onEnd: () {
            setState(() {
              _color = getRandomColor();
            });
          },
          builder: (context, value, child) {
            return ColorFiltered(
              colorFilter: ColorFilter.mode(
                value!,
                BlendMode.srcATop,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(length / 2),
                  color: Colors.red,
                ),
                height: length,
                width: length,
              ),
            );
          },
        )
      ],
    );
  }
}

class ColorfulCircleBuilder extends ItemBuilder {
  const ColorfulCircleBuilder();
  @override
  Widget buildWidget() {
    return const ColorfulCircle();
  }
}
