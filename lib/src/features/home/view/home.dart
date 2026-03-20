import 'package:dare_circle/src/features/home/widget/animated_background.dart';
import 'package:dare_circle/src/features/home/widget/home_content.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static const routePath = "/";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          AnimatedBackground(),
          HomeContent(),
        ],
      ),
    );
  }
}
