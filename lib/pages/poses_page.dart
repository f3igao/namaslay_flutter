import 'package:flutter/material.dart';
import 'package:namaslay_flutter/shared/poses_collection.dart';
import '../filters.dart';

class PosesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: filters.length,
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
            tabs: filters.map((Filter filter) {
              return Tab(text: filter.title);
            }).toList(),
            labelColor: Colors.black87,
            unselectedLabelColor: Colors.black26,
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: filters.map((Filter filter) {
            return PosesCollection(filter: filter);
          }).toList(),
        ),
      ),
    );
  }
}