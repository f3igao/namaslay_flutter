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
        height: (MediaQuery.of(context).size.height) * 0.12,
        child: _getBtn(handlePurchase, productTitle, productId));
  }
}

_getBtn(handlePurchase, productTitle, productId) {
  final bool isAnnual = productTitle == 'annual';
  print(isAnnual);
  final Color bgColor = isAnnual ? Colors.purple : Colors.white;
  final Color textColor = isAnnual ? Colors.white : Colors.purple;
  final String priceAnnual = '\$95.99';
  final String priceMonthly = '\$12.99';

  return FlatButton(
      color: bgColor,
      onPressed: () {
        handlePurchase((productId));
      },
      child: RichText(
          text:
              TextSpan(style: TextStyle(color: textColor), children: <TextSpan>[
        TextSpan(
            text: isAnnual ? priceAnnual : priceMonthly,
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
        TextSpan(text: isAnnual ? ' / YEAR' : ' / MONTH'),
        TextSpan(
            text: isAnnual ? ' (save 25%)' : '',
            style: TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold)),
      ])),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
          side: BorderSide(color: Colors.purple, width: 2.0)));
}
