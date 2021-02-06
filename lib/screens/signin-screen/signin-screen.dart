import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pondera/models/classes/user.dart';
import 'package:pondera/screens/signin-screen/components/signin-form.dart';
import 'package:pondera/utils/colors.dart';

class SigninScreen extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final PonderaUser user = PonderaUser();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;
    final pictureHeigh = 152.0;
    final pictureWidth = pictureHeigh * 2;
    return Scaffold(
      key: scaffoldKey,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  CustomColors.customOrange,
                  CustomColors.customPink,
                ])),
          ),
          CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                snap: true,
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                flexibleSpace: FlexibleSpaceBar(
                  title: const Text(
                    'Login',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  centerTitle: true,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: size.height -
                      mediaQuery.padding.top -
                      size.height * 0.082,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 632,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SignInForm(formKey: formKey, user: user),
                            Positioned(
                              top: 0,
                              child: SvgPicture.asset(
                                'assets/images/freelancer.svg',
                                height: pictureHeigh,
                                width: pictureWidth,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
