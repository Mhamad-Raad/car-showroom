import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/car_controller.dart';
import '../../core/widgets/rating_bar.dart';
import '../../core/theme/app_theme.dart';

class CarDetailView extends StatefulWidget {
  final String carId;
  const CarDetailView({super.key, required this.carId});

  @override
  State<CarDetailView> createState() => _CarDetailViewState();
}

class _CarDetailViewState extends State<CarDetailView> {
  double _myRating = 0;
  final _noteCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final carController = context.watch<CarController>();
    final car = carController.getById(widget.carId);

    if (car == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Car')),
        body: const Center(child: Text('Car not found')),
      );
    }

    final reviews = carController.reviewsFor(car.id);

    return Scaffold(
      appBar: AppBar(
        title: Text('${car.brand} ${car.name}'),
        actions: [
          IconButton(
            onPressed: () => carController.toggleFavorite(car.id),
            icon: Icon(
              car.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: car.isFavorite ? AppColors.limeAccent : null,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Hero image
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(
                car.heroImage,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  color: const Color(0xFF0F1114),
                  alignment: Alignment.center,
                  child: const Icon(Icons.directions_car,
                      size: 48, color: Colors.white70),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Specs
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: car.specs.entries.map((e) {
              return Chip(
                label: Text('${e.key}: ${e.value}'),
                side: const BorderSide(color: Color(0xFF232831)),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),

          // Aggregate rating
          Row(
            children: [
              RatingBar(value: car.avgRating),
              const SizedBox(width: 10),
              Text('${car.avgRating.toStringAsFixed(1)} (${car.ratingsCount})'),
            ],
          ),
          const SizedBox(height: 20),

          // Add review
          Text('Your rating',
              style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 8),
          RatingBar(
              value: _myRating,
              onChanged: (v) => setState(() => _myRating = v)),
          const SizedBox(height: 12),
          TextField(
            controller: _noteCtrl,
            maxLines: 3,
            decoration: const InputDecoration(
              hintText: 'Add a short note (optional)…',
            ),
          ),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            onPressed: () {
              if (_myRating <= 0) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Pick a star rating first')),
                );
                return;
              }
              carController.addRating(
                carId: car.id,
                stars: _myRating,
                note: _noteCtrl.text.trim().isEmpty
                    ? null
                    : _noteCtrl.text.trim(),
              );
              setState(() {
                _myRating = 0;
                _noteCtrl.clear();
              });
            },
            icon: const Icon(Icons.star),
            label: const Text('Submit review'),
          ),
          const SizedBox(height: 24),

          // Reviews list
          if (reviews.isEmpty)
            const Text('No reviews yet. Be the first!',
                style: TextStyle(color: AppColors.textMuted))
          else
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Recent reviews',
                    style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 12),
                ...reviews.reversed.take(8).map((r) => ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(Icons.person),
                      title: Text('${r.stars.toStringAsFixed(1)} ★'),
                      subtitle: r.note == null ? null : Text(r.note!),
                      trailing: Text(
                        '${r.createdAt.hour.toString().padLeft(2, '0')}:${r.createdAt.minute.toString().padLeft(2, '0')}',
                        style: const TextStyle(color: AppColors.textMuted),
                      ),
                    )),
              ],
            ),
        ],
      ),
    );
  }
}
