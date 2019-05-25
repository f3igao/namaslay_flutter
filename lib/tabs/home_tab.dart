import 'package:flutter/material.dart';

List<String> mockWorkouts = [
  'Sunrise Yoga',
  'Wind Down',
  'Bedtime Yoga',
  'Cardio Blast',
  'Power Your Purpose',
  'Find Your Flow',
  'Meditation in Motion',
  'Calm Your Mind',
  'Mental Detox',
  'Root Down',
  'Playtime'
];

List<String> mockThemes = [
  'Featured Workouts',
  'Crowd Favorites',
  'Heart Openers',
  'Hips Openers',
];

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.black87),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
            itemBuilder: _buildHomeRow,
            itemCount: mockThemes.length,
          ))
        ],
        // children: <Widget>[
        //   HomeRow('1'),
        //   HomeRow('2'),
        //   HomeRow('3'),
        //   HomeRow('4'),
        //   HomeRow('5'),
        // ],
        // children: <Widget>[... flows.map((flow)=> HomeRow(flow)])
      ),
    );
  }
}

// Widget _buildWorkoutsRow(BuildContext context, int index) {
//   return Column(
//     children: <Widget>[
//       Text(mockThemes[index],
//           style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, color: Colors.black87)),
//       ListView.builder(
//           itemBuilder: _buildWorkoutTile, itemCount: mockWorkouts.length)
//     ],
//   );
// }

Widget _buildHomeRow(BuildContext context, int index) {
  return Column(
    children: <Widget>[
      Text(mockThemes[index],
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
              color: Colors.black87)),
      Row(children: [
        Expanded(
            child: SizedBox(
                height: 150.0,
                child: ListView.builder(
                  itemBuilder: _buildWorkoutTile,
                  itemCount: mockWorkouts.length,
                  scrollDirection: Axis.horizontal,
                )))
      ])
    ],
  );
}

Widget _buildWorkoutTile(BuildContext context, int index) {
  return Container(
      child: Center(child: Text(mockWorkouts[index])),
      width: 150,
      color: Colors.amber,
      margin: EdgeInsets.all(15));
}

// class HomeRow extends StatelessWidget {
//   final String workoutTheme;
//   HomeRow(this.workoutTheme);
//   @override
//   Widget build(BuildContext context) {
//     return Column(flo
//       children: <Widget>[
//         Text(workoutTheme,
//             style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
//         WorkoutsRow(),
//       ],
//     );
//   }
// }

// class WorkoutsRow extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         height: 150.0,
//         // child: ListView(
//         //   scrollDirection: Axis.horizontal,
//         //   children: <Widget>[
//         //     WorkoutTile(mockWorkouts[0]),
//         //     WorkoutTile(mockWorkouts[1]),
//         //     WorkoutTile(mockWorkouts[2]),
//         //     WorkoutTile(mockWorkouts[3]),
//         //   ],
//         // ));
//         child: _buildWorkoutsRow(context, index);
//   }
// }

// class WorkoutTile extends StatelessWidget {
//   final String flowName;
//   WorkoutTile(this.flowName);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         child: Center(child: Text(this.flowName)),
//         width: 150,
//         color: Colors.amber,
//         margin: EdgeInsets.all(15));
//   }
// }
