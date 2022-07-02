// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../widgets/item_test2.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ItemDao extends ChangeNotifier {
  // final CollectionReference collection =
  //     FirebaseFirestore.instance.collection('items');

  // void saveItem(Item item) {
  //   collection.add(item.toJson());
  // }

  // Stream<QuerySnapshot> getItemStream() {
  //   return collection.snapshots();
  // }

  // Llave que utilizará la instancia de SharedPreferences:
  static const String _prefFavoritesTitle = 'favoriteItems';
  List<String> favoritesTitle = <String>[];

  // Lista de elementos puestos en favoritos.
  List<ItemTest> itemFavorited = <ItemTest>[];

  final List<ItemTest> productList1 = <ItemTest>[
    ItemTest(
        key: UniqueKey(),
        image: 'assets/images/bisquet.png',
        price: 8.00,
        title: 'Bisquet',
        subtitle: 'Panadería'),
    ItemTest(
        key: UniqueKey(),
        image: 'assets/images/bolillo.png',
        price: 2.00,
        title: 'Bolillo',
        subtitle: 'Panadería'),
    ItemTest(
        key: UniqueKey(),
        image: 'assets/images/concha.png',
        price: 7.50,
        title: 'Concha',
        subtitle: 'Panadería'),
    ItemTest(
        key: UniqueKey(),
        image: 'assets/images/delicia.png',
        price: 10.00,
        title: 'Delicia',
        subtitle: 'Panadería'),
    ItemTest(
        key: UniqueKey(),
        image: 'assets/images/dona.png',
        price: 10.00,
        title: 'Dona',
        subtitle: 'Panadería'),
    ItemTest(
        key: UniqueKey(),
        image: 'assets/images/mantecada.png',
        price: 8.00,
        title: 'Mantecada',
        subtitle: 'Panadería'),
    ItemTest(
        key: UniqueKey(),
        image: 'assets/images/polvoron.png',
        price: 7.50,
        title: 'Polvorón',
        subtitle: 'Panadería'),
    ItemTest(
        key: UniqueKey(),
        image: 'assets/images/rebanada.png',
        price: 8.00,
        title: 'Rebanada',
        subtitle: 'Panadería'),
    ItemTest(
        key: UniqueKey(),
        image: 'assets/images/trebol.png',
        price: 7.50,
        title: 'Trebol',
        subtitle: 'Panadería'),
    ItemTest(
        key: UniqueKey(),
        image: 'assets/images/yoyo.png',
        price: 8.00,
        title: 'Beso',
        subtitle: 'Panadería'),
  ];

  final List<ItemTest> productList2 = <ItemTest>[
    ItemTest(
        key: UniqueKey(),
        image: 'assets/images/pastel_1.png',
        price: 130.00,
        title: 'Choco-fresa',
        subtitle: 'Repostería'),
    ItemTest(
        key: UniqueKey(),
        image: 'assets/images/pastel_2.png',
        price: 145.00,
        title: 'Choco-trufa',
        subtitle: 'Repostería'),
    ItemTest(
        key: UniqueKey(),
        image: 'assets/images/pastel_3.png',
        price: 125.00,
        title: 'Fresa-Cereza',
        subtitle: 'Repostería'),
    ItemTest(
        key: UniqueKey(),
        image: 'assets/images/pastel_4.png',
        price: 145.00,
        title: 'Tres leches',
        subtitle: 'Repostería'),
    ItemTest(
        key: UniqueKey(),
        image: 'assets/images/pastel_5.png',
        price: 25.00,
        title: 'Queso-Cajeta',
        subtitle: 'Repostería'),
    ItemTest(
        key: UniqueKey(),
        image: 'assets/images/pastel_6.png',
        price: 25.00,
        title: 'Elmo-Cup',
        subtitle: 'Repostería'),
    ItemTest(
        key: UniqueKey(),
        image: 'assets/images/postre_1.png',
        price: 20.00,
        title: 'Galle-licia',
        subtitle: 'Repostería'),
    ItemTest(
        key: UniqueKey(),
        image: 'assets/images/postre_2.png',
        price: 17.00,
        title: 'Choco-nuez',
        subtitle: 'Repostería'),
    ItemTest(
        key: UniqueKey(),
        image: 'assets/images/postre_3.png',
        price: 18.00,
        title: 'Budin-Coco',
        subtitle: 'Repostería'),
    ItemTest(
        key: UniqueKey(),
        image: 'assets/images/postre_4.png',
        price: 17.00,
        title: 'Choco-cup',
        subtitle: 'Repostería'),
    ItemTest(
        key: UniqueKey(),
        image: 'assets/images/postre_5.png',
        price: 19.00,
        title: 'Pingüi-fresa',
        subtitle: 'Repostería'),
  ];

  final List<ItemTest> productList3 = <ItemTest>[
    ItemTest(
        key: UniqueKey(),
        image: 'assets/images/especial_1.png',
        price: 12.00,
        title: 'Galle-Jengibre',
        subtitle: 'Especiales'),
    ItemTest(
        key: UniqueKey(),
        image: 'assets/images/especial_2.png',
        price: 15.00,
        title: 'Pan de Muerto',
        subtitle: 'Especiales'),
    ItemTest(
        key: UniqueKey(),
        image: 'assets/images/especial_3.png',
        price: 25.00,
        title: 'Muerto Relleno',
        subtitle: 'Especiales'),
    ItemTest(
        key: UniqueKey(),
        image: 'assets/images/especial_4.png',
        price: 1525.00,
        title: 'Pay de Perro',
        subtitle: 'Especiales'),
    ItemTest(
        key: UniqueKey(),
        image: 'assets/images/especial_5.png',
        price: 170.00,
        title: 'Rosca de Reyes',
        subtitle: 'Especiales'),
  ];

  void loadSharedPreferences() async {
    final preferences = await SharedPreferences.getInstance();
    final favorites = preferences.getStringList(_prefFavoritesTitle);
    if (favorites != null) {
      favoritesTitle = favorites;
    } else {
      favoritesTitle = <String>[];
    }
    preferences.setStringList(_prefFavoritesTitle, favoritesTitle);
    notifyListeners();
  }

  void saveFavoritesIDs() async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setStringList(_prefFavoritesTitle, favoritesTitle);
    notifyListeners();
  }

  void addFavoriteItem(ItemTest item) async {
    final preferences = await SharedPreferences.getInstance();
    var favoritesList = preferences.getStringList(_prefFavoritesTitle);
    if (favoritesList == null) {
      return;
    } else if (!favoritesList.contains(item.title)) {
      favoritesTitle.add(item.title);
      itemFavorited.add(item);
      saveFavoritesIDs();
      notifyListeners();
    } else {
      return;
    }
  }

  void setFavoriteItems() {
    for (var i = 0; i < productList1.length; i++) {
      if (!favoritesTitle.contains(productList1[i].title)) {
        continue;
      } else {
        ItemTest item = ItemTest(
            image: productList1[i].image,
            title: productList1[i].title,
            subtitle: productList1[i].subtitle,
            price: productList1[i].price);
        if (!itemFavorited.contains(item)) {
          itemFavorited.add(item);
        }
      }
    }
    for (var i = 0; i < productList2.length; i++) {
      if (!favoritesTitle.contains(productList2[i].title)) {
        continue;
      } else {
        ItemTest item = ItemTest(
            image: productList2[i].image,
            title: productList2[i].title,
            subtitle: productList2[i].subtitle,
            price: productList2[i].price);
        if (!itemFavorited.contains(item)) {
          itemFavorited.add(item);
        }
      }
    }
    for (var i = 0; i < productList3.length; i++) {
      if (!favoritesTitle.contains(productList3[i].title)) {
        continue;
      } else {
        ItemTest item = ItemTest(
            image: productList3[i].image,
            title: productList3[i].title,
            subtitle: productList3[i].subtitle,
            price: productList3[i].price);
        if (!itemFavorited.contains(item)) {
          itemFavorited.add(item);
        }
      }
    }
    notifyListeners();
    // TODO: Considerar utilizar SQLite para guardar la lista de items Favoritos
  }
}
