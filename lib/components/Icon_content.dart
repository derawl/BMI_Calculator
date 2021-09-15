import 'package:flutter/material.dart';
import 'constants.dart';

class iconCard extends StatelessWidget {
  final IconData? genderIcon;
  final String genderText;
  iconCard({this.genderIcon, this.genderText=''});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          genderIcon,
          size: 80.0,
        ),
        SizedBox(
          width: 15.0,
        ),
        Text(
          genderText,
          style: kgenderTextStyle,
        )

      ],
    );
  }
}
