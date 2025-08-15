import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class LimeHeroCard extends StatelessWidget {
  final Widget? overlayTopLeft;
  final Widget? overlayBottom;
  final Widget child;

  const LimeHeroCard({
    super.key,
    required this.child,
    this.overlayTopLeft,
    this.overlayBottom,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.limeAccent, Color(0xFFC8F53A)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: const [
          BoxShadow(
            color: Color(0x552AFF00),
            blurRadius: 24,
            spreadRadius: 2,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: Stack(
          children: [
            Positioned.fill(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.black.withOpacity(.22),
                      Colors.black.withOpacity(.08),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
            if (overlayTopLeft != null)
              Positioned(left: 14, top: 14, child: overlayTopLeft!),
            Padding(
              padding: const EdgeInsets.all(22),
              child: child,
            ),
            if (overlayBottom != null)
              Positioned(
                  left: 16, right: 16, bottom: 16, child: overlayBottom!),
          ],
        ),
      ),
    );
  }
}
