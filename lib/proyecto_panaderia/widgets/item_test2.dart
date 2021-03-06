import 'package:flutter/material.dart';
import '../screens/item_details_screen.dart';
import 'package:provider/provider.dart';
import '../models/item_dao.dart';

class ItemTest extends StatefulWidget {
  final String image;
  final String title;
  final String subtitle;
  final double price;

  const ItemTest(
      {Key? key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.price})
      : super(key: key);

  @override
  _ItemTestState createState() => _ItemTestState();
}

class _ItemTestState extends State<ItemTest> {
  // int counter = 0;

  // void _setFavorite() {
  //   setState(() {
  //     _isFavorited = !_isFavorited;
  //     // TODO. Para esto requiero un provider:
  //     // if (_isFavorited) {
  //     //   BottomNavigation(cartItems: counter + 1);
  //     // }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size / 2;
    return Consumer<ItemDao>(
      builder: (context, itemDao, child) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ItemDetails(
                  image: widget.image,
                  price: widget.price,
                  subtitle: widget.subtitle,
                  title: widget.title,
                  key: widget.key,
                ),
              ),
            );
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 5.0,
            child: Padding(
              padding: const EdgeInsets.all(1.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Hero(
                    tag: widget.key.toString(),
                    child: Image.asset(
                      widget.image,
                      height: 110,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.subtitle,
                    style: const TextStyle(
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '\$${widget.price.toStringAsFixed(2)}',
                          style: const TextStyle(fontSize: 16),
                        ),
                        IconButton(
                          onPressed: () {
                            itemDao.addFavoriteItem(widget);
                            const snackBar =
                                SnackBar(content: Text('Agregado a Favoritos'));
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            //     // TODO. Para esto requiero un provider:
                            //     // if (_isFavorited) {
                            //     //   BottomNavigation(cartItems: counter + 1);
                            //     // }
                            setState(() {});
                          },
                          icon: itemDao.itemFavorited.contains(widget)
                              ? const Icon(Icons.favorite)
                              : const Icon(Icons.favorite_border_outlined),
                          iconSize: 25,
                          color: itemDao.itemFavorited.contains(widget)
                              ? Colors.limeAccent[400]
                              : Colors.limeAccent[600],
                        )
                      ]),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
