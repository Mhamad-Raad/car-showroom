import 'package:flutter/foundation.dart';
import '../models/car.dart';
import '../models/review.dart';
import '../data/seed/cars_seed.dart';

class CarController extends ChangeNotifier {
  final List<Car> _cars = List<Car>.from(seededCars);

  final Map<String, List<Review>> _reviews = {};

  String _search = '';

  List<Car> get cars {
    final list =
        _cars.map((c) => c.withAggregates(_reviews[c.id] ?? const [])).toList();
    if (_search.isEmpty) return list;
    final q = _search.toLowerCase();
    return list
        .where((c) =>
            c.name.toLowerCase().contains(q) ||
            c.brand.toLowerCase().contains(q))
        .toList();
  }

  String get search => _search;

  void setSearch(String value) {
    _search = value;
    notifyListeners();
  }

  Car? getById(String id) {
    Car? base;
    for (final c in _cars) {
      if (c.id == id) {
        base = c;
        break;
      }
    }
    if (base == null) return null;
    return base.withAggregates(_reviews[id] ?? const []);
  }

  List<Review> reviewsFor(String carId) =>
      List.unmodifiable(_reviews[carId] ?? const []);

  void toggleFavorite(String id) {
    final idx = _cars.indexWhere((c) => c.id == id);
    if (idx == -1) return;
    final car = _cars[idx];
    _cars[idx] = car.copyWith(isFavorite: !car.isFavorite);
    notifyListeners();
  }

  void addRating({
    required String carId,
    required double stars,
    String? note,
  }) {
    if (stars < 0 || stars > 5) throw Exception('Stars must be 0–5');
    final list = _reviews.putIfAbsent(carId, () => <Review>[]);
    list.add(Review(carId: carId, stars: stars, note: note));
    notifyListeners();
  }

  void clearAll() {
    _reviews.clear();
    for (var i = 0; i < _cars.length; i++) {
      _cars[i] =
          _cars[i].copyWith(isFavorite: false, avgRating: 0, ratingsCount: 0);
    }
    _search = '';
    notifyListeners();
  }
}
