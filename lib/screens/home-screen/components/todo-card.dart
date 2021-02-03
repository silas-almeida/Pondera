import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pondera/utils/colors.dart';

class ToDoCard extends StatelessWidget {
  final String text;
  final String imagePath;

  ToDoCard({this.text, this.imagePath});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final imageHeight = (size.height * 0.34) * 0.33;
    final imageWidth = imageHeight * 2;
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                    CustomColors.customOrange,
                    CustomColors.customOrange.withAlpha(230),
                  ])),
              height: size.height * 0.34,
              width: size.width * 0.44,
            ),
          ),
          Positioned(
            top: (size.height * 0.34) * 0.55,
            child: SizedBox(
              child: SvgPicture.asset(
                imagePath,
                width: imageWidth,
                height: imageHeight,
                semanticsLabel: 'Resultados',
                alignment: Alignment.center,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: (size.height * 0.34) * 0.50,
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
