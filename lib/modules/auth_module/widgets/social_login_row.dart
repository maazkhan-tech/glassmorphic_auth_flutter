import 'package:flutter/material.dart';
import '../../../common/app_colors.dart';
import '../../../common/app_text_styles.dart';

class SocialLoginRow extends StatelessWidget {
  const SocialLoginRow({
    super.key,
    this.onGoogleTap,
    this.onAppleTap,
    this.onFacebookTap,
  });

  final VoidCallback? onGoogleTap;
  final VoidCallback? onAppleTap;
  final VoidCallback? onFacebookTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Divider(color: Colors.white.withValues(alpha: 0.08)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Text('OR CONTINUE WITH', style: AppTextStyles.caption),
            ),
            Expanded(
              child: Divider(color: Colors.white.withValues(alpha: 0.08)),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _SocialCircleButton(
              icon: Icons.g_mobiledata_rounded,
              onTap: onGoogleTap,
              size: 30,
            ),
            const SizedBox(width: 16),
            _SocialCircleButton(icon: Icons.apple_rounded, onTap: onAppleTap),
            const SizedBox(width: 16),
            _SocialCircleButton(
              icon: Icons.facebook_rounded,
              onTap: onFacebookTap,
            ),
          ],
        ),
      ],
    );
  }
}

class _SocialCircleButton extends StatelessWidget {
  const _SocialCircleButton({required this.icon, this.onTap, this.size = 22});

  final IconData icon;
  final VoidCallback? onTap;
  final double size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: AppColors.surfaceDark,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
        ),
        child: Icon(icon, color: AppColors.textPrimary, size: size),
      ),
    );
  }
}
