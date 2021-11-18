import 'package:flutter/material.dart';
import 'bottom_navigation.dart';
// import 'package:panaderiapp/screens/home_screen.dart';
// import 'package:panaderiapp/screens/home_test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const BottomNavigation(),
    );
  }
}
