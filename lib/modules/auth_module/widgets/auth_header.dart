import 'package:flutter/material.dart';
import '../../../common/app_colors.dart';
import '../../../common/app_text_styles.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withValues(alpha: 128),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: const Icon(Icons.bolt_rounded, color: Colors.white, size: 30),
        ),
        const SizedBox(height: 24),
        Text(title, style: AppTextStyles.heading1),
        const SizedBox(height: 8),
        Text(subtitle, style: AppTextStyles.subtitle),
      ],
    );
  }
}
