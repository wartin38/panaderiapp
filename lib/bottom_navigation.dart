import 'package:flutter/material.dart';
import '../screens/cart_screen.dart';
import '../screens/favorites_screen.dart';
import '../screens/home_screen.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  static const List<Widget> _availableScreens = <Widget>[
    HomeScreen(),
    FavoritesScreen(),
    CartScreen(),
  ];

  void _onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _availableScreens.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 18,
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: 'Inicio',
              backgroundColor: Colors.brown),
          BottomNavigationBarItem(
              icon: const Icon(Icons.favorite),
              // icon: Stack(
              //   children: [
              //     const Icon(Icons.favorite),
              //     Positioned(
              //       left: 0,
              //       top: 0,
              //       child: Text(widget.cartItems.toString()),
              //     ),
              //   ],
              // ),
              label: 'Favoritos',
              backgroundColor: Colors.brown[600]),
          BottomNavigationBarItem(
              icon: const Icon(Icons.shopping_cart),
              label: 'Carrito',
              backgroundColor: Colors.brown[800]),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green[600],
        // selectedItemColor: Colors.orange[600],
        onTap: _onTapped,
        // type: BottomNavigationBarType.shifting,
        selectedFontSize: 16,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.brown,
      ),
    );
  }
}
