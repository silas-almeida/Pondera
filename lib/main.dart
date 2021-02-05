import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:pondera/models/providers/user-provider.dart';
import 'package:pondera/screens/initial-screen/isLogged.dart';
import 'package:pondera/utils/materialColors.dart';
import 'package:provider/provider.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
          lazy: false,
        )
      ],
      child: KeyboardDismisser(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Pondera',
          theme: ThemeData(
            primarySwatch: CustomMaterialColors.materialBlueGrey,
            accentColor: CustomMaterialColors.materialOrange,
            fontFamily: 'Inter',
          ),
          home: IsLogged(),
        ),
      ),
    );
  }
}
