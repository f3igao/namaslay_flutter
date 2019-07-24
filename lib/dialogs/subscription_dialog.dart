import 'dart:async';

import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class SubscriptionDialog extends StatefulWidget {
  @override
  SubscriptionDialogState createState() => SubscriptionDialogState();
}

class SubscriptionDialogState extends State<SubscriptionDialog> {
  StreamSubscription<List<PurchaseDetails>> _subscription;

  @override
  void initState() {
    final Stream purchaseUpdates =
        InAppPurchaseConnection.instance.purchaseUpdatedStream;
    _subscription = purchaseUpdates.listen((purchases) {
      _handlePurchaseUpdates(purchases);
    });
    super.initState();
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  void _handlePurchaseUpdates(purchases) {
    print('handling $purchases');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget> [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                child: Text('PAYYYYY')),
            Container(
                margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                child: Text('PAYYYYY')),
            Container(
                margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                child: Text('PAYYYYY')),
          ],
        ),
        // cancel icon
        Positioned(
            left: 0.0,
            top: 0.0,
            child: SafeArea(
                child: IconButton(
              icon: Icon(Icons.close, color: Colors.black54),
              onPressed: () {
                Navigator.pop(context);
              },
            ))),
      ],
    ));
  }
}
