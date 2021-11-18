import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'dart:ui';

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import '../widgets/item_test2.dart';
// import 'package:panaderiapp/widgets/item_widget.dart';

final List<Widget> productList1 = <Widget>[
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

final List<Widget> productList2 = <Widget>[
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

final List<Widget> productList3 = <Widget>[
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

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  int _selectedIndex = 0;
  final List allProductsLists = [
    productList1,
    productList2,
    productList3,
  ];

  // Nombres:
  static const String section1 = "Como Recién Salido del Horno";
  static const String section2 = "Prueba Nuestra Repostería";
  static const String section3 = "Nuestros Especiales";

  final List sectionName = [
    section1,
    section2,
    section3,
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  void _onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          toolbarHeight: 45,
          pinned: true,
          expandedHeight: 180.0,
          flexibleSpace: FlexibleSpaceBar(
            background: Stack(
              children: [
                Image.asset(
                  'assets/images/fondo.jpg',
                  fit: BoxFit.none,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ],
            ),
            // background: ImageFiltered(
            //   imageFilter: ImageFilter.blur(sigmaY: 3, sigmaX: 3),
            //   child: Image.asset(
            //     'assets/images/fondo.jpg',
            //     fit: BoxFit.none,
            //   ),
            // ),
            centerTitle: true,
            // titlePadding: const EdgeInsets.symmetric(vertical: 10.0),
            title: Padding(
              padding: const EdgeInsets.only(bottom: 42),
              child: Stack(
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
          ),
          bottom: TabBar(
            onTap: _onTapped,
            indicator: BoxDecoration(
              border: Border.all(color: Colors.black),
              color: Colors.green[600],
              // color: Colors.orange.shade600,
              borderRadius: BorderRadius.circular(8),
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            labelPadding: const EdgeInsets.all(0),
            padding: const EdgeInsets.only(bottom: 0),
            labelStyle:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            unselectedLabelStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            // unselectedLabelColor: Colors.grey.shade200,
            unselectedLabelColor: Colors.white,
            // indicatorColor: Colors.grey.shade400,
            indicatorWeight: 2.0,
            // indicatorSize: TabBarIndicatorSize.tab,
            controller: _tabController,
            labelColor: Colors.white,
            tabs: <Widget>[
              Tab(
                iconMargin: const EdgeInsets.only(top: 1),
                height: 48,
                text: 'Panadería',
                // child: Container(
                //   color: Colors.orange.shade200,
                //   child: const Text(
                //     'Panadería',
                //     style: TextStyle(color: Colors.white),
                //   ),
                // ),
                icon: const Icon(
                  Icons.breakfast_dining,
                  color: Colors.white,
                  size: 20,
                ),
                key: UniqueKey(),
              ),
              Tab(
                iconMargin: const EdgeInsets.only(top: 1),
                height: 48,
                text: 'Repostería',
                icon: const Icon(
                  Icons.cake,
                  color: Colors.white,
                  size: 20,
                ),
                key: UniqueKey(),
              ),
              Tab(
                iconMargin: const EdgeInsets.only(top: 1),
                height: 48,
                text: 'Especiales',
                icon: const Icon(
                  Icons.card_giftcard,
                  color: Colors.white,
                  size: 20,
                ),
                key: UniqueKey(),
              ),
            ],
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green[600],
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                  child: Text(
                    sectionName.elementAt(_selectedIndex),
                    style: const TextStyle(
                      fontSize: 18,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
        SliverGrid.count(
          childAspectRatio: 0.8,
          children: allProductsLists.elementAt(_selectedIndex),
          crossAxisCount: 2,
        ),
      ],
    );
  }
}
