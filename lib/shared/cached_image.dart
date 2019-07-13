import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  final String url;
  final bool showLoader;
  final double alignmentX;
  final double alignmentY;
  CachedImage({this.url, this.showLoader = false, this.alignmentX = 0.0, this.alignmentY = 0.0});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, url) => showLoader
          ? Center(
              child: CircularProgressIndicator(
                  valueColor:
                      AlwaysStoppedAnimation<Color>(Colors.purpleAccent)),
            )
          : null,
      errorWidget: (context, url, error) => Center(
            child: Icon(Icons.error, color: Colors.purple, size: 40.0),
          ),
      fit: BoxFit.cover,
      alignment: Alignment(alignmentX, alignmentY),
    );
  }
}
