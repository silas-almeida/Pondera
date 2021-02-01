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
    return Card(
      elevation: 3.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            borderRadius: BorderRadius.circular(12),
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
            top: 140,
            child: SizedBox(
              child: SvgPicture.asset(
                imagePath,
                width: 200,
                height: 100,
                semanticsLabel: 'Resultados',
                alignment: Alignment.center,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 180,
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
