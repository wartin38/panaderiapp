import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/item_dao.dart';
import '../widgets/item_test2.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ItemDao>(
      builder: (context, itemDao, child) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 45,
            centerTitle: true,
            title: Stack(
              children: [
                Text(
                  '¡Panadería Don Gabo!',
                  style: TextStyle(
                      fontSize: 22,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 6
                        ..color = Colors.green.shade600),
                ),
                const Text(
                  '¡Panadería Don Gabo!',
                  style: TextStyle(
                    fontSize: 22,
                    // color: Colors.orange.shade600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Favoritos',
                  style: TextStyle(fontSize: 36, color: Colors.brown[600]),
                ),
              ),
              Flexible(
                child: ListView.builder(
                  padding: const EdgeInsets.all(8.0),
                  itemCount: itemDao.itemFavorited.length,
                  itemBuilder: (context, index) {
                    if (itemDao.itemFavorited.isNotEmpty) {
                      return itemDao.itemFavorited[index];
                    } else {
                      return const Center(
                          child: Text(
                              'No tienes ningún artículo en favoritos todavía'));
                    }
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
