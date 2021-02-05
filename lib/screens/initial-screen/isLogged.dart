import 'package:flutter/material.dart';
import 'package:pondera/models/providers/user-provider.dart';
import 'package:pondera/screens/home-screen/home-screen.dart';
import 'package:pondera/screens/initial-screen/initial-screen.dart';
import 'package:pondera/utils/colors.dart';
import 'package:provider/provider.dart';

class IsLogged extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (_, userProvider, __) {
        if (userProvider.loading) {
          return Scaffold(
            body: Container(
              color: CustomColors.customOrange,
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                ),
              ),
            ),
          );
        } else {
          if (userProvider.firebaseUser != null) {
            return HomeScreen();
          } else {
            return InitialScreen();
          }
        }
      },
    );
  }
}
