import 'package:flutter/material.dart';

class SubscriptionButton extends StatelessWidget {
  final Function handlePurchase;
  final String purchase;

  SubscriptionButton(this.handlePurchase, this.purchase);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width) * 0.80,
      height: (MediaQuery.of(context).size.height) * 0.10,
      child: RaisedButton(
          onPressed: () {
            handlePurchase((purchase));
          },
          child: Text(purchase),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0))),
    );
  }
}
