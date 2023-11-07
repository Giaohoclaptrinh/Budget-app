import 'package:flutter/material.dart';
import 'package:Project2/lib/screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Budget UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.green,
      ),//Themdata
      home: HomeScreen()
    );//MaterialDart
  }
}

