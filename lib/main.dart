// import 'dart:async';
import 'app.dart';
import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'model/poses_data.dart';
import 'model/workouts_data.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
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