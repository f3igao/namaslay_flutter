import 'package:flutter/material.dart';
import 'package:namaslay_flutter/widgets/cached_image.dart';

class WorkoutImages extends StatefulWidget {
  final String prevImageUrl;
  final String currImageUrl;
  WorkoutImages(this.prevImageUrl, this.currImageUrl);

  @override
  State<StatefulWidget> createState() {
    return _WorkoutImagesState();
  }
}

bool _showFirst = true;

class _WorkoutImagesState extends State<WorkoutImages>
    with TickerProviderStateMixin {

  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
        firstChild: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.90,
          margin: EdgeInsets.symmetric(vertical: 20.0),
          height: (MediaQuery.of(context).size.height) * 0.50,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: CachedImage(url: widget.prevImageUrl),
          ),
        ),
        secondChild: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.90,
          margin: EdgeInsets.symmetric(vertical: 20.0),
          height: (MediaQuery.of(context).size.height) * 0.50,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: CachedImage(url: widget.currImageUrl),
          ),
        ),
        crossFadeState:
            _showFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        duration: Duration(seconds: 1));
  }
}
