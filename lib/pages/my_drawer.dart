import 'package:animation_app/widgets/animated_card.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.black12,
        child: Column(
          children: [
            const Spacer(),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                ),
                const Spacer(),
                const Column(
                  children: [
                    Text(
                      'One more thing 👇🏻',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    AnimatedCard(),
                  ],
                ),
                const Spacer(),
              ],
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
