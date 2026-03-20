import 'dart:math';

import 'package:dare_circle/src/resources/app_colors.dart';
import 'package:flutter/material.dart';

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({super.key});

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 14),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: _BackgroundPainter(animationValue: _controller.value),
          size: Size.infinite,
        );
      },
    );
  }
}

class _BackgroundPainter extends CustomPainter {
  final double animationValue;

  _BackgroundPainter({required this.animationValue});

  @override
  void paint(Canvas canvas, Size size) {
    final gradientAngle = animationValue * 2 * pi;
    final shiftX = cos(gradientAngle) * 0.2;
    final shiftY = sin(gradientAngle) * 0.2;

    final bgPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment(-0.5 + shiftX, -1.0 + shiftY),
        end: Alignment(0.5 - shiftX, 1.0 - shiftY),
        colors: [
          AppColors.neutral,
          const Color(0xFF1E1E3A),
          const Color(0xFF2A1A3E),
          AppColors.neutral,
        ],
        stops: const [0.0, 0.35, 0.65, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), bgPaint);

    _drawOrb(
      canvas,
      center: Offset(
        size.width * (0.2 + 0.15 * sin(gradientAngle)),
        size.height * (0.3 + 0.1 * cos(gradientAngle * 1.3)),
      ),
      radius: size.width * 0.4,
      color: AppColors.primary.withValues(alpha: 0.18),
    );

    _drawOrb(
      canvas,
      center: Offset(
        size.width * (0.8 + 0.1 * cos(gradientAngle * 0.7)),
        size.height * (0.2 + 0.12 * sin(gradientAngle * 0.9)),
      ),
      radius: size.width * 0.35,
      color: AppColors.secondary.withValues(alpha: 0.15),
    );

    _drawOrb(
      canvas,
      center: Offset(
        size.width * (0.5 + 0.2 * sin(gradientAngle * 1.1 + 1.5)),
        size.height * (0.75 + 0.08 * cos(gradientAngle * 0.8)),
      ),
      radius: size.width * 0.45,
      color: AppColors.primary.withValues(alpha: 0.12),
    );

    _drawOrb(
      canvas,
      center: Offset(
        size.width * (0.15 + 0.1 * cos(gradientAngle * 1.4 + 0.8)),
        size.height * (0.85 + 0.06 * sin(gradientAngle * 1.2)),
      ),
      radius: size.width * 0.3,
      color: AppColors.secondary.withValues(alpha: 0.12),
    );
  }

  void _drawOrb(Canvas canvas,
      {required Offset center, required double radius, required Color color}) {
    final paint = Paint()
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 40)
      ..shader = RadialGradient(
        colors: [color, color.withValues(alpha: 0)],
        stops: const [0.2, 1.0],
      ).createShader(
        Rect.fromCircle(center: center, radius: radius),
      );

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(_BackgroundPainter oldDelegate) =>
      oldDelegate.animationValue != animationValue;
}
