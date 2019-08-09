import 'dart:async';
import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:namaslay_flutter/util/subscription_helpers.dart';
import 'package:namaslay_flutter/widgets/subscription_button.dart';

final String subTitle = 'Unlock Premium Today';
final String subText =
    'Get access to a growing catalog of guided workouts and posture breakdowns, added every week and curated by experts.';
final String subTrial = 'Try one week for free';
final String subDisclaimer =
    'After the free trial, each Namaslay Premium subscription tier has a cost as per above. Subscription automatically renews unless turned off in iTunes Settings at least 24 hours before current period ends. Any unused portion of a free trial is forfeited after purchase. By continuing, you agree to our Terms and Privacy Policy.';

class SubscriptionDialog extends StatefulWidget {
  @override
  SubscriptionDialogState createState() => SubscriptionDialogState();
}

class SubscriptionDialogState extends State<SubscriptionDialog> {
  // Updates to purchases
  StreamSubscription<List<PurchaseDetails>> _subscription;

  // The In App Purchase plugin
  InAppPurchaseConnection _iap = InAppPurchaseConnection.instance;

  // Products for sale
  List<ProductDetails> _products = [];

  // Past purchases
  List<PurchaseDetails> _purchases = [];
  // _hasPurchased(monthlySubId) == null;

  @override
  void initState() {
    _initialize();
    super.initState();
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  void _initialize() async {
    // Connect to storefront
    bool _available = await _iap.isAvailable();
    if (_available) {
      await _getProducts();
      await _getPastPurchases();
      // Verify and deliver a purchase with your own business logic
      // _verifyPurchase();
    } else {
      print('Store is not available.');
    }

    // Listen to new purchases
    _subscription = _iap.purchaseUpdatedStream.listen((data) => setState(() {
          _purchases.addAll(data);
          // _verifyPurchase();
        }));
  }

  // Get all products available for sale
  Future<void> _getProducts() async {
    Set<String> _ids = Set.from([monthlySubId, annualSubId]);
    ProductDetailsResponse response = await _iap.queryProductDetails(_ids);
    if (response.notFoundIDs.isNotEmpty) {
      print('Cannot find product details.');
    } else {
      setState(() {
        _products = response.productDetails;
      });
    }
  }

  // Purchase a product
  void _handlePurchase(String productId) {
    ProductDetails targetProduct =
        _products.singleWhere((p) => p.id == productId);
    final PurchaseParam purchaseParam =
        PurchaseParam(productDetails: targetProduct);

    _iap.buyNonConsumable(purchaseParam: purchaseParam);
  }

  // Gets past purchases
  Future<void> _getPastPurchases() async {
    QueryPurchaseDetailsResponse response = await _iap.queryPastPurchases();
    setState(() {
      _purchases = response.pastPurchases;
    });
  }

  // Returns purchase of specific product ID
  // PurchaseDetails _hasPurchased(String productID) {
  //   return _purchases.firstWhere((purchase) => purchase.productID == productID,
  //       orElse: () => null);
  // }

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
                        Colors.white30,
                        Colors.white,
                      ],
                      stops: [0, 0.75],
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
                      icon: Icon(Icons.close, color: Colors.black87),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ))),
                SafeArea(
                  minimum:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(
                            bottom:
                                (MediaQuery.of(context).size.height) * 0.01),
                        child: Text(
                          subTitle,
                          style: TextStyle(
                              fontSize: 28.0,
                              color: Colors.black87,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            bottom:
                                (MediaQuery.of(context).size.height) * 0.03),
                        child: Text(
                          subText,
                          style:
                              TextStyle(fontSize: 16.0, color: Colors.black87),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            bottom:
                                (MediaQuery.of(context).size.height) * 0.02),
                        child: Text(
                          subTrial,
                          style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Wrap(
                        runSpacing: 15,
                        alignment: WrapAlignment.center,
                        children: <Widget>[
                          SubscriptionButton(_handlePurchase, monthlySubId),
                          SubscriptionButton(_handlePurchase, annualSubId),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: (MediaQuery.of(context).size.height) * 0.03),
                        child: Text(
                          subDisclaimer,
                          style:
                              TextStyle(fontSize: 10.0, color: Colors.black54),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}
