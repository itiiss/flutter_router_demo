import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(
      //   title: const Text('Second Nested Page'),
      // ),
      body: Center(
        child: Text('Favorite Page'),
      ),
    );
  }
}
