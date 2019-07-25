import 'dart:async';
import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:namaslay_flutter/widgets/subscription_button.dart';

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

  void _handlePurchase(purchase) {
    print('handling $purchase');
  }

  // double _getBtnWidth() => (MediaQuery.of(context).size.width) * 0.80;
  // double _getBtnHeight() => (MediaQuery.of(context).size.height) * 0.10;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/sub-bg.jpg'),
                fit: BoxFit.cover)),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
              children: <Widget>[
                // gradient overlay
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.white,
                      ],
                      stops: [0, 0.80],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      tileMode: TileMode.repeated,
                    ),
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
                SafeArea(
                    child: Center(
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical:
                                (MediaQuery.of(context).size.height) * 0.10),
                        child: Text(
                          'Unlock Premium Today',
                          style: TextStyle(fontSize: 30.0, color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Wrap(
                        runSpacing: 20,
                        children: <Widget>[
                          SubscriptionButton(_handlePurchase, 'monthly'),
                          SubscriptionButton(_handlePurchase, 'semi-annual'),
                          SubscriptionButton(_handlePurchase, 'annual'),
                        ],
                      ),
                    ],
                  ),
                )),
              ],
            )));
  }
}
