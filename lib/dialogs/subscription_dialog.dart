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

  void _handlePurchase(type) {
    print(type);
  }

  double _getBtnWidth() => (MediaQuery.of(context).size.width) * 0.80;
  double _getBtnHeight() => (MediaQuery.of(context).size.height) * 0.11;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        SafeArea(
          child: Text('unlock premium today'),
        ),
        Center(
          child: Wrap(
            runSpacing: 20,
            children: <Widget>[
              SizedBox(
                width: _getBtnWidth(),
                height: _getBtnHeight(),
                child: RaisedButton(
                    onPressed: () {
                      _handlePurchase(('monthly'));
                    },
                    child: Text('monthly'),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0))),
              ),
              SizedBox(
                width: _getBtnWidth(),
                height: _getBtnHeight(),
                child: RaisedButton(
                  onPressed: () {
                    _handlePurchase(('semi-annual'));
                  },
                  child: Text('semi-annual'),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                ),
              ),
              SizedBox(
                  width: _getBtnWidth(),
                  height: _getBtnHeight(),
                  child: RaisedButton(
                    onPressed: () {
                      _handlePurchase(('annual'));
                    },
                    child: Text('annual'),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                  )),
            ],
          ),
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
