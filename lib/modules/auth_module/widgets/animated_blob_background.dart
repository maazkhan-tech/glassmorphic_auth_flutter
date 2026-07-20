import 'dart:ui';
import 'package:flutter/material.dart';
import '../../../common/app_colors.dart';

class AnimatedBlobBackground extends StatefulWidget {
  const AnimatedBlobBackground({super.key});

  @override
  State<AnimatedBlobBackground> createState() =>
      _AnimatedBlobBackgroundState();
}

class _AnimatedBlobBackgroundState extends State<AnimatedBlobBackground>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      decoration: const BoxDecoration(gradient: AppColors.backgroundGradient),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          final t = _controller.value;
          return Stack(
            children: [
              Positioned(
                top: -size.width * 0.35 + (t * 40),
                left: -size.width * 0.3 + (t * 20),
                child: _blob(size.width * 0.9, AppColors.primary.withValues(alpha: 0.55)),
              ),
              Positioned(
                bottom: -size.width * 0.4 - (t * 30),
                right: -size.width * 0.35 - (t * 15),
                child: _blob(size.width * 0.85, AppColors.accent.withValues(alpha: 0.35)),
              ),
              Positioned(
                top: size.height * 0.35 - (t * 25),
                right: -size.width * 0.25,
                child: _blob(size.width * 0.55, AppColors.primaryLight.withValues(alpha: 0.25)),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
                child: Container(color: Colors.transparent),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _blob(double diameter, Color color) {
    return Container(
      width: diameter,
      height: diameter,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }
}