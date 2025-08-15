class Review {
  final String carId;
  final double stars; // 0.0–5.0
  final String? note;
  final DateTime createdAt;

  Review({
    required this.carId,
    required this.stars,
    this.note,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  Review copyWith({
    String? carId,
    double? stars,
    String? note,
    DateTime? createdAt,
  }) {
    return Review(
      carId: carId ?? this.carId,
      stars: stars ?? this.stars,
      note: note ?? this.note,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
