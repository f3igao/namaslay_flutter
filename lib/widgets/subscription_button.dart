import 'package:flutter/material.dart';

class SubscriptionButton extends StatelessWidget {
  final Function handlePurchase;
  final String productTitle;
  final String productId;

  SubscriptionButton(this.handlePurchase, this.productTitle, this.productId);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width) * 0.80,
      height: (MediaQuery.of(context).size.height) * 0.10,
      child: RaisedButton(
          onPressed: () {
            handlePurchase((productId));
          },
          child: Text(productTitle),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0))),
    );
  }
}
