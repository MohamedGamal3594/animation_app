import 'package:flutter/material.dart';
import 'dart:math' as math;

Color getRandomColor() => Color(
      0xFF000000 + math.Random().nextInt(0xFFFFFF),
    );

class ColorfulCircleView extends StatefulWidget {
  const ColorfulCircleView({super.key});

  @override
  State<ColorfulCircleView> createState() => _ColorfulCircleViewState();
}

class _ColorfulCircleViewState extends State<ColorfulCircleView> {
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
