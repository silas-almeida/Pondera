import 'package:flutter/material.dart';
import 'package:pondera/utils/colors.dart';

class ToDoCard extends StatelessWidget {
  final String text;

  ToDoCard(this.text);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      elevation: 12.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: CustomColors.customOrange,
      child: Stack(children: [
        Container(
          height: size.height * 0.34,
          width: size.width * 0.44,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 20),
            ),
          ),
        ),
      ]),
    );
  }
}
