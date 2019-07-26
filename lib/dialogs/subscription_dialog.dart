import 'dart:async';
import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:namaslay_flutter/widgets/subscription_button.dart';

final String testID = 'gems_test';

class SubscriptionDialog extends StatefulWidget {
  @override
  SubscriptionDialogState createState() => SubscriptionDialogState();
}

class SubscriptionDialogState extends State<SubscriptionDialog> {
  StreamSubscription<List<PurchaseDetails>> _subscription;

  /// Is the API available on the device
  bool available = true;

  /// The In App Purchase plugin
  InAppPurchaseConnection _iap = InAppPurchaseConnection.instance;

  /// Products for sale
  List<ProductDetails> _products = [];

  /// Past purchases
  List<PurchaseDetails> _purchases = [];

  /// Updates to purchases
  // StreamSubscription _subscription;

  /// Consumable credits the user can buy
  int credits = 0;

  @override
  void initState() {
    // _initialize();
    final Stream purchaseUpdates =
        InAppPurchaseConnection.instance.purchaseUpdatedStream;
    _subscription = purchaseUpdates.listen((purchases) {
      print('test');
      // _handlePurchaseUpdates(purchases);
    });
    super.initState();
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  /// Initialize data
  void _initialize() async {
    // Check availability of In App Purchases
    bool _available = await _iap.isAvailable();
    print(_available);
    print(_iap);
    await _getProducts();

    if (available) {
      await _getProducts();
      // await _getPastPurchases();

      // Verify and deliver a purchase with your own business logic
      // _verifyPurchase();
    }
  }

  /// Get all products available for sale
  Future<void> _getProducts() async {
    print('hit get products');
    Set<String> ids = Set.from([testID, 'test_a']);
    ProductDetailsResponse response = await _iap.queryProductDetails(ids);
    print(response.productDetails);
    setState(() {
      _products = response.productDetails;
    });
  }

  void _handlePurchase(purchase) {
    print('handling $purchase');
  }

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
