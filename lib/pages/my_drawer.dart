import 'package:animation_app/widgets/animated_card.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.black12,
        child: Center(
          child: Transform.translate(
            offset: Offset(
              MediaQuery.of(context).size.width * 0.1,
              0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'One more thing 👇🏻',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.7,
                  ),
                  child: const AnimatedCard(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
