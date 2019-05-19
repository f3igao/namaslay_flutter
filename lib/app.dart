import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Namaslay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: CupertinoPageScaffold(
        child: TabBar(),
      ),
    );
  }
}

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoPageScaffold(
//       navigationBar: CupertinoNavigationBar(
//         leading: const Text('Home'),
//       ),
//       child: TabBar(),
//     );
//   }
// }

class TabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            title: Text('Workouts'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            title: Text('Explore'),
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(builder: (context) {
              // return CupertinoPageScaffold(child: Container());
              return CupertinoPageScaffold(child: HomeTab());
            });
          case 1:
            return CupertinoTabView(builder: (context) {
              // return CupertinoPageScaffold(child: Container());
              return CupertinoPageScaffold(child: WorkoutTab());
            });
          case 2:
            return CupertinoTabView(builder: (context) {
              // return CupertinoPageScaffold(child: Container());
              return CupertinoPageScaffold(child: ExploreTab());
            });
        }
      },
    );
  }
}

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() {
    return _HomeTabState();
  }
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: const <Widget>[
        CupertinoSliverNavigationBar(
          largeTitle: Text('Home'),
        ),
      ],
    );
  }
}

class WorkoutTab extends StatefulWidget {
  @override
  _WorkoutTabState createState() {
    return _WorkoutTabState();
  }
}

class _WorkoutTabState extends State<WorkoutTab> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: const <Widget>[
        CupertinoSliverNavigationBar(
          largeTitle: Text('Workouts'),
        ),
      ],
    );
  }
}


class ExploreTab extends StatefulWidget {
  @override
  _ExploreTabState createState() {
    return _ExploreTabState();
  }
}

class _ExploreTabState extends State<ExploreTab> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: const <Widget>[
        CupertinoSliverNavigationBar(
          largeTitle: Text('Explore'),
        ),
      ],
    );
  }
}