import 'package:flutter/material.dart';

class SubscriptionButton extends StatelessWidget {
  final Function handlePurchase;
  final String productTitle;
  final String productId;

  SubscriptionButton(this.handlePurchase, this.productTitle, this.productId);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: (MediaQuery.of(context).size.width) * 0.85,
        height: (MediaQuery.of(context).size.height) * 0.10,
        child: _getBtn(handlePurchase, productTitle, productId));
  }
}

_getBtn(handlePurchase, productTitle, productId) {
  final bool isAnnual = productTitle == 'annual';
  final Color bgColor = isAnnual ? Colors.purple : Colors.white;
  final Color textColor = isAnnual ? Colors.white : Colors.purple;
  final String buttonText =
      isAnnual ? '\$95.99 / YEAR' : productTitle == 'monthly' ? '\$12.99 / MONTH' : '\$10.99 / MONTH';

  return FlatButton(
      textColor: textColor,
      color: bgColor,
      onPressed: () {
        handlePurchase((productId));
      },
      child: Text(buttonText),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
          side: BorderSide(color: Colors.purple, width: 2.0)));
}