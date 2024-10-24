import 'package:hive/hive.dart';

part 'webtoon.g.dart';

/// Webtoon Model
@HiveType(typeId: 1)
class Webtoon {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final String imageUrl;

  @HiveField(2)
  final String genre;

  @HiveField(3)
  final String description;

  @HiveField(4)
  final String creator;

  @HiveField(5)
  double rating;

  Webtoon({
    required this.title,
    required this.imageUrl,
    required this.genre,
    required this.description,
    required this.creator,
    this.rating = 0.0,
  });
}
