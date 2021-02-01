import 'package:flutter/material.dart';
import 'package:pondera/utils/colors.dart';

class ToDoCard extends StatelessWidget {
  final String text;

  ToDoCard(this.text);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: CustomColors.customOrange,
      child: Stack(children: [
        Container(
          height: 80,
          width: 200,
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
