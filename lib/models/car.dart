// lib/models/car.dart
import 'review.dart';

class Car {
  final String id;
  final String name;
  final String brand;
  final String heroImage;
  final Map<String, String> specs;
  final bool isFavorite;
  final double avgRating;
  final int ratingsCount;

  const Car({
    required this.id,
    required this.name,
    required this.brand,
    required this.heroImage,
    required this.specs,
    this.isFavorite = false,
    this.avgRating = 0.0,
    this.ratingsCount = 0,
  });

  Car copyWith({
    String? id,
    String? name,
    String? brand,
    String? heroImage,
    Map<String, String>? specs,
    bool? isFavorite,
    double? avgRating,
    int? ratingsCount,
  }) {
    return Car(
      id: id ?? this.id,
      name: name ?? this.name,
      brand: brand ?? this.brand,
      heroImage: heroImage ?? this.heroImage,
      specs: specs ?? this.specs,
      isFavorite: isFavorite ?? this.isFavorite,
      avgRating: avgRating ?? this.avgRating,
      ratingsCount: ratingsCount ?? this.ratingsCount,
    );
  }

  Car withAggregates(List<Review> reviews) {
    if (reviews.isEmpty) {
      return copyWith(avgRating: 0, ratingsCount: 0);
    }
    final total = reviews.fold<double>(0, (sum, r) => sum + r.stars);
    final count = reviews.length;
    return copyWith(avgRating: total / count, ratingsCount: count);
  }
}
