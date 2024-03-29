import 'package:flutter/material.dart';
import 'package:namaslay_flutter/model/workouts_data.dart';
import '../widgets/workouts_list.dart';

class WorkoutsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: workoutFilters.length,
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
            indicatorColor: Colors.purple,
            tabs: workoutFilters.map((String filter) {
              return Tab(text: filter);
            }).toList(),
            labelColor: Colors.black87,
            unselectedLabelColor: Colors.black26,
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: workoutFilters.map((String filter) {
            return WorkoutsList(filter: filter);
          }).toList(),
        ),
      ),
    );
  }
}
