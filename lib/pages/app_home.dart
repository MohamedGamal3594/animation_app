import 'package:animation_app/pages/home.dart';
import 'package:animation_app/pages/home_3drawer.dart';
import 'package:animation_app/pages/profile_drawer.dart';
import 'package:flutter/material.dart';

class AppHome extends StatelessWidget {
  const AppHome({super.key});
  static const id = 'AppHome';
  @override
  Widget build(BuildContext context) {
    return const Home3Drawer(
      drawer: ProfileDrawer(),
      home: Home(),
    );
  }
}
