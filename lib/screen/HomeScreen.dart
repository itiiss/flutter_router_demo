import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> _tabKey = GlobalKey<NavigatorState>();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
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
        title: const Text('Home'),
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
      body: Navigator(
        key: _tabKey,
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
          children: const [
            Text('First Page'),
            // ElevatedButton(
            //     onPressed: () {
            //       _navKey.currentState!.push(
            //         MaterialPageRoute(
            //           builder: (_) => const SubFirstPage(),
            //         ),
            //       );
            //     },
            //     child: const Text('Go to Nested Page 1'))
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
          children: const [
            Text('Second Page'),
            // ElevatedButton(
            //   onPressed: () {
            //     _navKey.currentState!.push(
            //       MaterialPageRoute(
            //         builder: (_) => const SubSecondPage(),
            //       ),
            //     );
            //   },
            //   child: const Text('Go to Nested Page 2'),
            // )
          ],
        ),
      ),
    );
  }
}
