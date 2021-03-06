import 'package:flutter/material.dart';
import 'bottom_navigation.dart';
// import 'package:panaderiapp/screens/home_screen.dart';
// import 'package:panaderiapp/screens/home_test.dart';
import '../models/item_dao.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ItemDao itemDao = ItemDao();
  itemDao.loadSharedPreferences();
  itemDao.setFavoriteItems();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // TODO: Agregar el provider para el carrito de compras (Puede ser el mismo?)
        ChangeNotifierProvider<ItemDao>(
          lazy: false,
          create: (_) => ItemDao(),
        ),
      ],
      child: MaterialApp(
        title: 'Panaderia_v1',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.brown,
        ),
        home: const BottomNavigation(),
      ),
    );
  }
}
