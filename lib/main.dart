import 'package:flutter/material.dart';
import 'package:pondera/screens/initial-screen/initial-screen.dart';
import 'package:pondera/utils/materialColors.dart';

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
        primarySwatch: CustomMaterialColors.materialBlueGrey,
        accentColor: CustomMaterialColors.materialOrange,
      ),
      home: InitialScreen(),
    );
  }
}
