import 'package:flutter/material.dart';

//Store this globally
final GlobalKey<NavigatorState> _navKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nested Navigator'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              child: Text('First Tab'),
            ),
            Tab(
              child: Text('Second Tab'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorites'),
        ],
      ),
      body: Navigator(
        key: _navKey,
        onGenerateRoute: (_) => MaterialPageRoute(
          builder: (_) => TabBarView(
            controller: _tabController,
            children: const [
              FirstPage(),
              SecondPage(),
            ],
          ),
        ),
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('First Page'),
            ElevatedButton(
                onPressed: () {
                  _navKey.currentState!.push(
                    MaterialPageRoute(
                      builder: (_) => const SubFirstPage(),
                    ),
                  );
                },
                child: const Text('Go to Nested Page 1'))
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Second Page'),
            ElevatedButton(
              onPressed: () {
                _navKey.currentState!.push(
                  MaterialPageRoute(
                    builder: (_) => const SubSecondPage(),
                  ),
                );
              },
              child: const Text('Go to Nested Page 2'),
            )
          ],
        ),
      ),
    );
  }
}

class SubFirstPage extends StatelessWidget {
  const SubFirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Nested Page'),
      ),
      body: const Center(
        child: Text('From First Page'),
      ),
    );
  }
}

class SubSecondPage extends StatelessWidget {
  const SubSecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Nested Page'),
      ),
      body: const Center(
        child: Text('From Second Page'),
      ),
    );
  }
}
