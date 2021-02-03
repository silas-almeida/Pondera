import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pondera/screens/initial-screen/initial-screen.dart';
import 'package:pondera/utils/materialColors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore.instance
        .collection('colection')
        .doc('teste')
        .set({'text': 'Silas'});
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
