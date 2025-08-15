import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AccentChip extends StatelessWidget {
  final String label;
  final IconData? icon;

  const AccentChip({super.key, required this.label, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.limeAccent.withOpacity(.16),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.limeAccent.withOpacity(.28)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 16, color: AppColors.limeAccent),
            const SizedBox(width: 6),
          ],
          Text(
            label,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
