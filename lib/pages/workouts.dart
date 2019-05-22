import 'package:flutter/material.dart';

import '../filters.dart';
import '../main_view.dart';

class Workouts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: filters.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Workouts',
            style: TextStyle(color: Colors.black87),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: TabBar(
            isScrollable: true,
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
            // return Padding(
            //   padding: const EdgeInsets.all(16.0),
            //   child: MainView(filter: filter),
            // );
            return MainView(filter: filter);
          }).toList(),
        ),
      ),
    );
  }
}
