import 'package:flutter/material.dart';
import '../../core/widgets/grid_overlay.dart';
import '../../core/widgets/lime_hero_card.dart';
import '../../core/widgets/primary_button.dart';
import '../../core/widgets/accent_chip.dart';
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
                const SizedBox(height: 24),
                Text('RateCars',
                    style: Theme.of(context).textTheme.headlineLarge),
                const SizedBox(height: 20),
                Expanded(
                  child: LimeHeroCard(
                    overlayTopLeft: const AccentChip(
                      label: 'Drive Your Way',
                      icon: Icons.bolt,
                    ),
                    overlayBottom: const Row(
                      children: [
                        Icon(Icons.speed, color: Colors.black87),
                        SizedBox(width: 8),
                        Text('Fast • Clean • Fun',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.black87,
                            )),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Spacer(),
                        Text(
                          'Rate cars with style.',
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge
                              ?.copyWith(color: Colors.black, fontSize: 36),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Beautiful UI, smooth UX — front-end only.',
                          style: TextStyle(color: Colors.black87),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                PrimaryButton(
                  label: 'Get Started',
                  icon: Icons.arrow_forward,
                  expanded: true,
                  onPressed: () =>
                      Navigator.of(context).pushNamed(AppRoutes.login),
                ),
                const SizedBox(height: 24),
                Text('Black + Neon Lime UI • MVC',
                    style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: AppColors.backgroundDark,
    );
  }
}
