import 'package:flutter/material.dart';
import 'package:namaslay_flutter/pages/home_page.dart';
import 'package:namaslay_flutter/pages/poses_page.dart';
import 'package:namaslay_flutter/pages/profile_page.dart';
import 'package:namaslay_flutter/pages/workouts_page.dart';

class AppHome extends StatefulWidget {
  AppHome({Key key}) : super(key: key);

  @override
  _AppHomeState createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  int _selectedIndex = 0;
  static List<Widget> _tabOptions = <Widget>[
    HomePage(),
    WorkoutsPage(),
    PosesPage(),
    ProfilePage(),
  ];

  void _onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _tabOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // showSelectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            title: Text('Workouts'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            title: Text('Posture Clinic'),
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.person),
          //   title: Text('Me'),
          // ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        onTap: _onTabTapped,
      ),
    );
  }
}
