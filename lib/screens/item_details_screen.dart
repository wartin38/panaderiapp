import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class ItemDetails extends StatefulWidget {
  final String image;
  final String title;
  final String subtitle;
  final double price;

  const ItemDetails(
      {Key? key,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.price})
      : super(key: key);

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  int amount = 1;

  void _substractAmount() {
    setState(() {
      if (amount == 1) {
        amount = 1;
      } else {
        amount -= 1;
      }
    });
  }

  void _addAmount() {
    setState(() {
      amount += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.canPop(context) ? Navigator.pop(context) : null;
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              tag: widget.key.toString(),
              child: Image.asset(
                widget.image,
                height: 250,
                fit: BoxFit.contain,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              height: size.height * 0.6,
              decoration: const BoxDecoration(
                color: Colors.brown,
                // color: Colors.brown[400],
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        height: 45,
                        width: 95,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.green[600],
                        ),
                        child: Text(
                          '\$${widget.price.toStringAsFixed(2)}',
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Expanded(
                        child: SizedBox(),
                      ),
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.red[100],
                        ),
                        child: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(widget.title,
                      style: const TextStyle(
                        fontSize: 34,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'El pan, del latín panis, es un alimento básico que forma '
                    'parte de la dieta tradicional en Europa, Medio Oriente, India,'
                    'América y Oceanía',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Piezas:',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.red[200],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: IconButton(
                          iconSize: 28,
                          icon: Icon(Icons.remove, color: Colors.red[900]),
                          onPressed: _substractAmount,
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        child: SizedBox(
                          child: Text(
                            '$amount',
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.green[200],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: IconButton(
                          iconSize: 28,
                          icon: Icon(Icons.add, color: Colors.green[900]),
                          onPressed: _addAmount,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.canPop(context) ? Navigator.pop(context) : null;
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.green[600],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '\$${(widget.price * amount).toStringAsFixed(2)}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 7,
                          ),
                          const Icon(
                            Icons.add,
                            size: 22,
                            color: Colors.white,
                          ),
                          const Text(
                            'Agregar al carrito',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
