import 'package:animation_app/pages/hero_details.dart';
import 'package:animation_app/pages/home.dart';
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
        Home.id: (context) => const Home(),
        HeroDetails.id: (context) => const HeroDetails(),
      },
      initialRoute: Home.id,
    );
  }
}
