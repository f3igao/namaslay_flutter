import 'package:flutter/material.dart';

import 'flows.dart';

class FlowContainer extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _FlowContainerState();
  }
}

class _FlowContainerState extends State<FlowContainer> {
  List<String> _flows = ['Heart Opener', 'Hips Opener', 'Sunrise Yoga', 'Wind Down', 'Bedtime Yoga', 'Cardio Blast', 'Power Your Purpose', 'Find Your Flow', 'Meditation in Motion', 'Calm Your Mind', 'Mental Detox', 'Root Down', 'Playtime'];

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Flows(_flows));
  }
}
