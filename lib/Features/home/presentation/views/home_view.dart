import 'package:flutter/material.dart';

import 'widgets/custom_nav_bar.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeViewBody();
  }
}

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});
  static const String routeName = 'home';

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    HomeView(),
    Center(child: Text('Category Screen')),
    Center(child: Text('Delivery Screen')),
    Center(child: Text('Cart Screen')),
    Center(child: Text('Profile Screen')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: CustomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
