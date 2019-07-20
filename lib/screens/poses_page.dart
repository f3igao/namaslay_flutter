import 'package:flutter/material.dart';
import 'package:namaslay_flutter/model/poses_data.dart';
import 'package:namaslay_flutter/widgets/poses_collection.dart';

class PosesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: poseFilters.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Posture Clinic",
            style: TextStyle(color: Colors.black87),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Colors.purple,
            tabs: poseFilters.map((Filter filter) {
              return Tab(text: filter.title);
            }).toList(),
            labelColor: Colors.black87,
            unselectedLabelColor: Colors.black26,
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: poseFilters.map((Filter filter) {
            return PosesCollection(filter: filter);
          }).toList(),
        ),
      ),
    );
  }
}
