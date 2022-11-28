import 'package:flutter/material.dart';
import 'package:sweettreat/config/const.dart';
import 'package:sweettreat/pages/favorites/favorites_body.dart';
import 'package:sweettreat/pages/home/home_body.dart';
import 'package:sweettreat/pages/seen/seen_body.dart';

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeBody(),
    FavoritesBody(),
    SeenBody(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sweet Treat',
          style: TextStyle(
              color: stPrimary,
              fontWeight: FontWeight.w400,
              fontSize: 20,
              letterSpacing: 1),
        ),
        backgroundColor: stBackground,
        elevation: 0,
      ),
      body: Container(
        color: stBackground,
        child: _widgetOptions[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: sizeIconButton,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.cookie_outlined),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_outline_rounded),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.remove_red_eye_outlined),
            label: 'Seen',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: stPrimary,
        onTap: _onItemTapped,
        backgroundColor: stBackground,
      ),
    );
  }
}
