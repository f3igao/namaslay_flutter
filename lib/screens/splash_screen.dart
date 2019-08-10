import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

import 'package:namaslay_flutter/util/globals.dart' as globals;

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  InAppPurchaseConnection _iap = InAppPurchaseConnection.instance;
  List<PurchaseDetails> _purchases = [];

  Future _startTime() async {
    return Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed('/home');
    });
  }

  @override
  void initState() {
    super.initState();
    _initialize();
    _startTime();
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
      globals.isPremium = _hasPurchased(globals.monthlySubId) != null;
    });
  }

  PurchaseDetails _hasPurchased(String productID) {
    return _purchases.firstWhere((purchase) => purchase.productID == productID,
        orElse: () => null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[Image.asset('assets/icon/icon-small.png')],
      ),
    );
  }
}
