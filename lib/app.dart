import 'dart:async';
import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:namaslay_flutter/screens/home_page.dart';
import 'package:namaslay_flutter/screens/poses_page.dart';
import 'package:namaslay_flutter/screens/profile_page.dart';
import 'package:namaslay_flutter/screens/workouts_page.dart';

final String monthlySubId = 'pwxvte76v7';
final String annualSubId = 'fctsnbiy2b';
bool isPremium = false;

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

  InAppPurchaseConnection _iap = InAppPurchaseConnection.instance;
  List<PurchaseDetails> _purchases = [];

  @override
  void initState() {
    _initialize();
    super.initState();
  }

  void _initialize() async {
    bool _available = await _iap.isAvailable();
    if (_available) {
      await _getPastPurchases();
    }
  }

  Future<void> _getPastPurchases() async {
    QueryPurchaseDetailsResponse response = await _iap.queryPastPurchases();
    setState(() {
      _purchases = response.pastPurchases;
    });
  }

  PurchaseDetails _hasPurchased(String productID) {
    return _purchases.firstWhere((purchase) => purchase.productID == productID,
        orElse: () => null);
  }

  @override
  Widget build(BuildContext context) {
    isPremium = _hasPurchased(monthlySubId) != null;

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
