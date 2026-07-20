import 'package:flutter/material.dart';
import '../../../common/app_colors.dart';
import '../../../common/app_text_styles.dart';

class AnimatedCheckboxRow extends StatelessWidget {
  const AnimatedCheckboxRow({
    super.key,
    required this.value,
    required this.onChanged,
    required this.label,
  });

  final bool value;
  final ValueChanged<bool> onChanged;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      behavior: HitTestBehavior.opaque,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            width: 22,
            height: 22,
            margin: const EdgeInsets.only(top: 2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              gradient: value ? AppColors.primaryGradient : null,
              color: value ? null : Colors.transparent,
              border: Border.all(
                color: value
                    ? Colors.transparent
                    : Colors.white.withValues(alpha: 0.25),
                width: 1.4,
              ),
            ),
            child: value
                ? const Icon(Icons.check_rounded, size: 16, color: Colors.white)
                : null,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text.rich(
              TextSpan(
                text: '$label ',
                style: AppTextStyles.caption.copyWith(fontSize: 13),
                children: [
                  TextSpan(
                    text: 'Terms of Service',
                    style: AppTextStyles.linkText.copyWith(fontSize: 13),
                  ),
                  TextSpan(
                    text: ' and ',
                    style: AppTextStyles.caption.copyWith(fontSize: 13),
                  ),
                  TextSpan(
                    text: 'Privacy Policy',
                    style: AppTextStyles.linkText.copyWith(fontSize: 13),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
