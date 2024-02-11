import 'package:flutter/material.dart';

class HeroDetailsScreen extends StatelessWidget {
  const HeroDetailsScreen({super.key});
  static const id = 'Hero';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero Animation'),
        centerTitle: true,
      ),
      body: const Hero(
        tag: 'hero',
        child: Center(
          child: Column(
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
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
