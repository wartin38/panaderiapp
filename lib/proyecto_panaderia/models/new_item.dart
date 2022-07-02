import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewItem extends ChangeNotifier {
  // Esta clase debe de ser change notifier porque aquí pondras el nuevo bool
  // isFavorited modificable!
  // This class should be both, the data and the ui here please! -- corrected--)
  // Esta clase puede tener sus propios métodos. Pregunta clave:
  //  Qué voy a hacer con estos datos?

  final String title;
  final String subtitle;
  final String image;
  final double price;
  bool isFavorited = false;

  NewItem(this.title, this.subtitle, this.image, this.price);

  bool checkFavoritesSharedPreferencesFirst(isFavorited) {
    return 
  }
}
