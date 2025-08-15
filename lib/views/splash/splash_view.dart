import 'package:flutter/material.dart';

import '../../core/widgets/grid_overlay.dart';
import '../../core/widgets/lime_hero_card.dart';
import '../../core/widgets/accent_chip.dart';
import '../../core/widgets/slide_to_start.dart';
import '../../core/theme/app_theme.dart';
import '../../core/router/app_router.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridOverlay(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Text('RateCars',
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(color: Colors.white, fontSize: 32)),

                const SizedBox(height: 14),

                Expanded(
                  child: LimeHeroCard(
                    overlayTopLeft: const AccentChip(
                        label: 'Drive Your Way', icon: Icons.bolt),
                    overlayBottom: const Row(
                      children: [
                        Icon(Icons.speed, color: Colors.black87),
                        SizedBox(width: 10),
                        Text(
                          'Fast • Clean • Fun',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.black87),
                        ),
                      ],
                    ),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Opacity(
                            opacity: 0.12,
                            child: Image.network(
                              'https://images.unsplash.com/photo-1511919884226-fd3cad34687c?q=80&w=1600&auto=format&fit=crop',
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) =>
                                  const SizedBox.shrink(),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Rate cars with style.',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge
                                      ?.copyWith(
                                          color: Colors.black, fontSize: 38),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  'Beautiful UI, smooth UX — front-end only.',
                                  style: TextStyle(color: Colors.black87),
                                ),
                                const SizedBox(height: 8),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                SlideToStart(
                  label: 'Slide to get started',
                  onComplete: () =>
                      Navigator.of(context).pushNamed(AppRoutes.login),
                ),

                const SizedBox(height: 16),
                Text('Black • Lime • MVC • Smooth',
                    style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: AppColors.backgroundDark,
    );
  }
}
