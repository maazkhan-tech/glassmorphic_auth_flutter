import 'package:flutter/material.dart';

class StaggeredFadeSlide extends StatelessWidget {
  const StaggeredFadeSlide({
    super.key,
    required this.controller,
    required this.interval,
    required this.child,
    this.beginOffset = const Offset(0, 0.15),
  });

  final AnimationController controller;
  final Interval interval;
  final Widget child;
  final Offset beginOffset;

  @override
  Widget build(BuildContext context) {
    final curved = CurvedAnimation(parent: controller, curve: interval);

    final fade = Tween<double>(begin: 0, end: 1).animate(curved);
    final slide = Tween<Offset>(
      begin: beginOffset,
      end: Offset.zero,
    ).animate(curved);

    return FadeTransition(
      opacity: fade,
      child: SlideTransition(position: slide, child: child),
    );
  }
}
