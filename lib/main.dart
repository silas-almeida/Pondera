import 'package:flutter/material.dart';
import 'package:pondera/screens/home-screen/home-screen.dart';
import 'package:pondera/screens/initial-screen/initial-screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pondera',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: InitialScreen(),
    );
  }
}
