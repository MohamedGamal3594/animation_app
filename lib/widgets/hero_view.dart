import 'package:animation_app/pages/hero_details.dart';
import 'package:animation_app/widgets/item_builder.dart';
import 'package:flutter/material.dart';

class HeroView extends StatelessWidget {
  const HeroView({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, HeroDetails.id);
          },
          child: Hero(
            tag: 'hero',
            flightShuttleBuilder: (flightContext, animation, flightDirection,
                fromHeroContext, toHeroContext) {
              switch (flightDirection) {
                case HeroFlightDirection.push:
                  return Material(
                    color: Colors.transparent,
                    child: toHeroContext.widget,
                  );
                case HeroFlightDirection.pop:
                  return Material(
                    color: Colors.transparent,
                    child: fromHeroContext.widget,
                  );
              }
            },
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Hero',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.cyan,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'animation',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class HeroBuilder extends ItemBuilder {
  const HeroBuilder();
  @override
  Widget buildWidget() {
    return const HeroView();
  }
}
