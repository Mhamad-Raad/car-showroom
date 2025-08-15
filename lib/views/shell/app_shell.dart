import 'package:flutter/material.dart';
import '../home/home_view.dart';
import '../owner/owner_view.dart';

class AppShell extends StatefulWidget {
  const AppShell({super.key});

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int _index = 0;

  final _pages = const [
    HomeView(),
    OwnerView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        child: _pages[_index],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.home_outlined),
              selectedIcon: Icon(Icons.home),
              label: 'Home'),
          NavigationDestination(
              icon: Icon(Icons.person_pin_circle_outlined),
              selectedIcon: Icon(Icons.person_pin_circle),
              label: 'Owner'),
        ],
        onDestinationSelected: (i) => setState(() => _index = i),
      ),
    );
  }
}
