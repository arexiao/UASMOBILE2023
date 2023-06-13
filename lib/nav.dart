import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'Event.dart';
import 'HomePage.dart';
import 'Event.dart';
import 'aboutus.dart';
import 'Drawer.dart';

class nav extends StatefulWidget {
  const nav({Key?key}) : super(key: key);
  @override
  State<nav> createState() => _navState();
}

class _navState extends State<nav>{
  int _selectedIndex = 0 ;
  List<Widget> _navOptions = <Widget>[
    HomePage(),
    Event(),
    aboutus(),
  ];
  void _onItemTapped(int index) {
    setState(() {
          _selectedIndex = index;
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: "News",),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: "About",),
        ],
        selectedIconTheme: IconThemeData(
          color: Colors.orange
        ), 
        selectedLabelStyle: TextStyle(
          color: Colors.orange,
        ),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: Center(
        child: _navOptions.elementAt(_selectedIndex),)
    );
  }
}
