import 'package:animation_app/screens/hero_details_screen.dart';
import 'package:animation_app/screens/home_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const AnimationApp(),
  ));
}

class AnimationApp extends StatelessWidget {
  const AnimationApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Animations App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      routes: {
        HomeScreen.id: (context) => const HomeScreen(),
        HeroDetailsScreen.id: (context) => const HeroDetailsScreen(),
      },
      initialRoute: HomeScreen.id,
    );
  }
}
