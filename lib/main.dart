// import 'dart:async';
import 'app.dart';
import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'model/poses_data.dart';
import 'model/workouts_data.dart';

Future main() async {
  fetchPosesData();
  fetchWorkoutsData();
  runApp(MaterialApp(
    title: 'Namaslay',
    // debugShowMaterialGrid: true,
    // showSemanticsDebugger: true,
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
    routes: <String, WidgetBuilder>{
      '/home': (BuildContext context) => AppHome(),
    },
  ));
}

// class Namaslay extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     fetchPosesData();
//     fetchWorkoutsData();

//     return MaterialApp(
//       // debugShowMaterialGrid: true,
//       // showSemanticsDebugger: true,
//       debugShowCheckedModeBanner: false,
//       title: 'Namaslay',
//       // home: SplashScreen(),
//       home: AppHome(),
//       routes: <String, WidgetBuilder>{
//         HOME_SCREEN: (BuildContext context) => AppHome(),
//       }
//     );
//   }
// }
