import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class RatingBar extends StatelessWidget {
  final double value;
  final ValueChanged<double>? onChanged;
  final int stars;

  const RatingBar({
    super.key,
    required this.value,
    this.onChanged,
    this.stars = 5,
  });

  @override
  Widget build(BuildContext context) {
    final v = value.clamp(0, stars.toDouble());
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(stars, (i) {
        final filled = v >= i + 1;
        final half = v > i && v < i + 1;
        Widget icon = Icon(
          filled ? Icons.star : (half ? Icons.star_half : Icons.star_border),
          size: 22,
          color: AppColors.limeAccent,
        );
        if (onChanged == null) return icon;
        return InkWell(
          borderRadius: BorderRadius.circular(6),
          onTap: () => onChanged!(i + 1.0),
          child: Padding(padding: const EdgeInsets.all(2), child: icon),
        );
      }),
    );
  }
}
