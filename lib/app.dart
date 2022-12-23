import 'package:flutter/material.dart';
import 'package:things/screen/FavoriteScreen.dart';
import 'package:things/screen/HomeScreen.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var tabIndex = 0;

  renderBody() {
    switch (tabIndex) {
      case 0:
        return const HomePage();
      case 1:
        return const FavoritePage();
      default:
        return const FavoritePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          // Navigator.of(context).push(
          //   MaterialPageRoute<void>(
          //     builder: (BuildContext context) => const FavoritePage(),
          //   ),
          // );
          setState(() {
            tabIndex = value;
          });
        },
        currentIndex: tabIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profolio'),
        ],
      ),
      body: renderBody(),
    );
  }
}
