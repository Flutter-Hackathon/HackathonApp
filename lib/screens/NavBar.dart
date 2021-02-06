import 'package:flutter/material.dart';
import 'package:hackathonapp/screens/Group.dart';
import 'package:hackathonapp/screens/Homepage.dart';
import 'package:hackathonapp/screens/MainPage.dart';
import 'package:hackathonapp/screens/Profile.dart';

class NavBar extends StatefulWidget {
  NavBar({Key key}) : super(key: key);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _pages = <Widget>[
    HomePage(),
    GroupPage(),
    ProfilePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: _pages.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'AnaSayfa',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.group),
              label: 'Grup',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Profil',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.green[500],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
