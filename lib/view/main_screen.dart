


import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lung_cancer/constants.dart';
import 'package:lung_cancer/view/chat_screen/chat_list_screen.dart';
import 'package:lung_cancer/view/profile_screen/profile_screen.dart';
import 'package:lung_cancer/view/scan_screen/detector1_screen.dart';

import 'home_screen/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static  final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    const Detector1Screen(),
    const ChatListScreen(),
    const ProfileScreen(),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (bool didPop) {

        exit(0);
      },
      child: Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset("images/home.png"),
              activeIcon:Image.asset("images/home.png",color: blueColor,),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Image.asset("images/scan.png"),
              activeIcon: Image.asset("images/scan2.png"),
              label: ""
            ),
            BottomNavigationBarItem(
              icon: Image.asset("images/chat.png"),
              activeIcon:Image.asset("images/chat.png",color: blueColor,),
              label: 'Chat',
            ),
             BottomNavigationBarItem(
              icon:Image.asset("images/person.png"),
              activeIcon:Image.asset("images/person.png",color: blueColor,),

              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w400,fontSize: 12),
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w400,fontSize: 12) ,
          unselectedItemColor: const Color(0xff484C52),
          selectedItemColor: blueColor,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
