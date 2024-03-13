import 'package:flutter/material.dart';

class HeroDetails extends StatelessWidget {
  const HeroDetails({super.key});
  static const id = 'Hero';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hero Animation',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
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
