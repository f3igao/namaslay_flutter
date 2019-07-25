import 'package:flutter/material.dart';

class PremiumLock extends StatelessWidget {
  final double iconSize;
  final double padding;

  PremiumLock(this.iconSize, this.padding);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: Colors.black54,
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.lock_outline,
        color: Colors.white,
        size: iconSize,
      ),
    );
  }
}
