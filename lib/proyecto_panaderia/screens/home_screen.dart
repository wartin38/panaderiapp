import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'dart:ui';

import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
// import '../widgets/item_test2.dart';
// import 'package:panaderiapp/widgets/item_widget.dart';
import 'package:provider/provider.dart';
import '../models/item_dao.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  int _selectedIndex = 0;

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

    return Consumer<ItemDao>(
      builder: (context, itemDao, child) {
        // En la version 2, esta es la parte en la que tengo que poner ya desde
        // ahorita los datos obtenidos desde firebase/firestore. Verificar si
        // para eso debo utilizar un buildStream o un Future builder.
        final List allProductsLists = [
          itemDao.productList1,
          itemDao.productList2,
          itemDao.productList3,
        ];
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
      },
    );
  }
}
