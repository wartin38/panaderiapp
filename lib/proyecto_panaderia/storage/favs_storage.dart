import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/item_test2.dart';

class FavoriteData {
  static const String prefsKey = 'favoriteItems';
  final List<String> favoritesIds = <String>[];

  void saveFavorite() async {
    final prefs = await SharedPreferences.getInstance();
    // prefs.set
  }
}
