import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pondera/screens/signin-screen/signin-screen.dart';
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
    final pictureHeigh = size.height * 0.28;
    final pictureWidth = pictureHeigh * 2;

    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
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
          SafeArea(
            child: Container(
              height: size.height * 0.35,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        'Pondera',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 42,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        'Seja bem-vindo!',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    Container(
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
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: size.height * 0.30,
            child: SvgPicture.asset(
              'assets/images/selecting_team.svg',
              height: pictureHeigh,
              width: pictureWidth,
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
                height: size.height * 0.30,
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
                              builder: (ctx) => SigninScreen(),
                            ),
                          );
                        },
                        child: Container(
                          height: 50,
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
                              fontSize: 20,
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
                          height: 50,
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
                            fontSize: 20,
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
