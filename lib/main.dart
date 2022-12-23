import 'package:flutter/material.dart';
import 'package:things/screen/FavoriteScreen.dart';
import 'package:things/screen/HomeScreen.dart';
import 'app.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: <String, WidgetBuilder>{
        "Home": (context) => const HomePage(),
        "Favorite": (context) => const FavoritePage(),
      },
      home: const MyApp()));
}
