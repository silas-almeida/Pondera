import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pondera/screens/home-screen/home-screen.dart';
import 'package:pondera/screens/signup-screen.dart/signup-screen.dart';
import 'package:pondera/utils/colors.dart';

class InitialScreen extends StatefulWidget {
  @override
  _InitialScreenState createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.center,
                colors: [
                  CustomColors.customOrange,
                  CustomColors.customOrange.withOpacity(0.90)
                ],
              ),
            ),
          ),
          Positioned(
            top: 80,
            left: 20,
            child: Container(
              child: Text(
                'Pondera',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 42,
                ),
              ),
            ),
          ),
          Positioned(
            top: 160,
            left: 20,
            child: Container(
              child: Text(
                'Seja bem-vindo!',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
          ),
          Positioned(
            top: 240,
            left: 20,
            child: Container(
              width: size.width,
              child: Text(
                'Aqui sua opinião importa! Cadastre, compartilhe e participe de votações!',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.8,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Positioned(
            top: 352,
            child: SvgPicture.asset(
              'assets/images/selecting_team.svg',
              height: 200,
              width: 100,
              semanticsLabel: 'Inicial',
              alignment: Alignment.center,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 0,
            child: ClipRRect(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0)),
              child: Container(
                color: Colors.white,
                width: size.width,
                height: size.height * 0.35,
                child: Card(
                  elevation: 8.0,
                  margin: EdgeInsets.zero,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => HomeScreen(),
                            ),
                          );
                        },
                        child: Container(
                          height: 60,
                          width: size.width * 0.80,
                          child: Center(
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          primary: CustomColors.customOrange,
                          textStyle: TextStyle(
                              color: CustomColors.customOrange,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => SignupScreen(),
                            ),
                          );
                        },
                        child: Container(
                          height: 60,
                          width: size.width * 0.80,
                          child: Center(
                            child: Text(
                              'Cadastre-se',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          primary: CustomColors.customOrange,
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
