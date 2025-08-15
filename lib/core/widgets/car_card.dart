import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/car.dart';
import '../../controllers/car_controller.dart';
import '../theme/app_theme.dart';
import 'rating_bar.dart';

class CarCard extends StatelessWidget {
  final Car car;
  final VoidCallback? onTap;

  const CarCard({super.key, required this.car, this.onTap});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<CarController>();

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Ink(
        decoration: BoxDecoration(
          color: AppColors.surfaceDark,
          borderRadius: BorderRadius.circular(24),
          gradient: AppColors.cardGradient,
          border: Border.all(color: const Color(0xFF1C2026)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              // Thumbnail
              ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: AspectRatio(
                  aspectRatio: 1.2,
                  child: Image.network(
                    car.heroImage,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      color: const Color(0xFF0F1114),
                      alignment: Alignment.center,
                      child: const Icon(Icons.directions_car,
                          size: 28, color: Colors.white70),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 14),
              // Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${car.brand} • ${car.name}',
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: -0.2,
                                )),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        RatingBar(value: car.avgRating),
                        const SizedBox(width: 8),
                        Text(
                          car.avgRating.toStringAsFixed(1),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        Text('  (${car.ratingsCount})',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: AppColors.textMuted,
                                )),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      car.specs.entries
                          .take(3)
                          .map((e) => '${e.key}: ${e.value}')
                          .join(' • '),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              // Favorite
              IconButton(
                onPressed: () => controller.toggleFavorite(car.id),
                icon: Icon(
                  car.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: car.isFavorite
                      ? AppColors.limeAccent
                      : AppColors.textMuted,
                ),
                tooltip: 'Favorite',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
