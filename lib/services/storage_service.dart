import 'package:hive_flutter/adapters.dart';
import '../models/webtoon.dart';

class StorageService {
  static const String _webtoonListBox = 'webtoonListBox';
  static const String _favoritesBox = 'favoritesBox';

  /// Initializing the hive and opening the boxes
  Future<void> initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(WebtoonAdapter());
    await Hive.openBox<Webtoon>(_webtoonListBox);
    await Hive.openBox<Webtoon>(_favoritesBox);
  }

  /// Store initial dummy webtoons in the webtoon list box
  Future<void> storeInitialWebtoons(List<Webtoon> webtoons) async {
    var box = Hive.box<Webtoon>(_webtoonListBox);
    await box.putAll(
        Map.fromEntries(webtoons.map((toon) => MapEntry(toon.title, toon))));
  }

  /// Retrieve all webtoons from the webtoon list box.
  List<Webtoon> getWebtoonList() {
    var box = Hive.box<Webtoon>(_webtoonListBox);
    return box.values.toList();
  }

  /// Add a webtoon to favorites.
  Future<void> addFavorite(Webtoon webtoon) async {
    var box = Hive.box<Webtoon>(_favoritesBox);
    await box.put(webtoon.title, webtoon);
  }

  /// Remove a webtoon from favorites.
  Future<void> removeFavorite(String title) async {
    var box = Hive.box<Webtoon>(_favoritesBox);
    await box.delete(title);
  }

  /// Get all favorite webtoons.
  List<Webtoon> getAllFavorites() {
    var box = Hive.box<Webtoon>(_favoritesBox);
    return box.values.toList();
  }

  /// Check if a webtoon is a favorite.
  bool isFavorite(String title) {
    var box = Hive.box<Webtoon>(_favoritesBox);
    return box.containsKey(title);
  }

  /// Update rating of a webtoon in favorites.
  Future<void> updateRating(Webtoon webtoon, double rating) async {
    var webtoonBox = Hive.box<Webtoon>(_webtoonListBox);
    var favoritesBox = Hive.box<Webtoon>(_favoritesBox);

    // Update rating in the webtoon list
    webtoon.rating = rating;
    await webtoonBox.put(webtoon.title, webtoon);

    // If the webtoon is also in favorites, update the rating there as well
    if (favoritesBox.containsKey(webtoon.title)) {
      await favoritesBox.put(webtoon.title, webtoon);
    }
  }
}
