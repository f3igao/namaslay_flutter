// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:in_app_purchase/in_app_purchase.dart';

// class SubscriptionDialog extends StatefulWidget {
//   @override
//   SubscriptionDialogState createState() => SubscriptionDialogState();
// }

// class SubscriptionDialogState extends State<SubscriptionDialog> {
//   // Updates to purchases
//   StreamSubscription<List<PurchaseDetails>> _subscription;

//   // The In App Purchase plugin
//   InAppPurchaseConnection _iap = InAppPurchaseConnection.instance;

//   // // Products for sale
//   // List<ProductDetails> _products = [];

//   // Past purchases
//   List<PurchaseDetails> _purchases = [];
//   // _hasPurchased(monthlySubId) == null;

//   @override
//   void initState() {
//     _initialize();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _subscription.cancel();
//     super.dispose();
//   }

//   void _initialize() async {
//     bool _available = await _iap.isAvailable();
//     if (_available) {
//       await _getPastPurchases();
//     } else {
//       print('Store is not available.');
//     }

//     // Listen to new purchases
//     _subscription = _iap.purchaseUpdatedStream.listen((data) => setState(() {
//           _purchases.addAll(data);
//           // _verifyPurchase();
//         }));
//   }

//   // Gets past purchases
//   Future<void> _getPastPurchases() async {
//     QueryPurchaseDetailsResponse response = await _iap.queryPastPurchases();
//     setState(() {
//       _purchases = response.pastPurchases;
//     });
//   }

//   // Returns purchase of specific product ID
//   PurchaseDetails _hasPurchased(String productID) {
//     return _purchases.firstWhere((purchase) => purchase.productID == productID,
//         orElse: () => null);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
