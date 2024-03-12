import 'package:animation_app/pages/app_home.dart';
import 'package:animation_app/pages/hero_details.dart';
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
        AppHome.id: (context) => const AppHome(),
        HeroDetails.id: (context) => const HeroDetails(),
      },
      initialRoute: AppHome.id,
    );
  }
}
