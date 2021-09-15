import 'package:flutter/material.dart';

class ResuableCard extends StatelessWidget {
  final Color? colour;
  final Widget? cardChild;
  final VoidCallback? onPress;

  ResuableCard({this.colour, this.cardChild, this.onPress});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10),
        ),
        child: cardChild,
      ),
    );
  }
}