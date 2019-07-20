import 'dart:async';
import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:namaslay_flutter/widgets/cached_image.dart';
import 'package:namaslay_flutter/widgets/countdown.dart';

class SubscriptionDialog extends StatefulWidget {
  @override
  SubscriptionDialogState createState() => SubscriptionDialogState();
}

class SubscriptionDialogState extends State<SubscriptionDialog> {
  InAppPurchaseConnection _iap = InAppPurchaseConnection.instance;
}
