import 'package:flutter/material.dart';

import 'package:news_app_new/view/homescreen/homescreen.dart';
import 'package:news_app_new/view/profilescreen.dart/profilescreen.dart';
import 'package:news_app_new/view/savedscreen.dart';
import 'package:news_app_new/view/searchscreen.dart';

class Bottomnavigationscreen extends StatefulWidget {
  const Bottomnavigationscreen({super.key});

  @override
  State<Bottomnavigationscreen> createState() => _BottomnavigationscreenState();
}

class _BottomnavigationscreenState extends State<Bottomnavigationscreen> {
  int selectedindex = 0;
  List<Widget> screens = [
    Homescreen(),
    Searchscreen(),
    Savedscreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[selectedindex],
      backgroundColor: Color.fromARGB(255, 24, 21, 21),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        onTap: (value) {
          selectedindex = value;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'saved'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
        ],
      ),
    );
  }
}
