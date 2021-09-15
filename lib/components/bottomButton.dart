import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  final VoidCallback? taped;
  final String? buttonString;

  BottomButton({this.buttonString, this.taped});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: taped,
      child: Container(
        color: kbottomContaineColor,
        margin: EdgeInsets.only(top: 10.0),
        height: kbottomContainerHeigth,
        width: double.infinity,
        child: Center(child: Text(buttonString.toString(), style: kLargeButtonTextStyle,)),
      ),
    );
  }
}
