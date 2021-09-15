import 'package:flutter/material.dart';
import 'screens/input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  final ThemeData theme = ThemeData.dark();
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme.copyWith(
        primaryColor: Color(0xff0A0E21),
        scaffoldBackgroundColor: Color(0xff0A0E21),
        //colorScheme: theme.colorScheme.copyWith(secondary: Colors.red),
      ),
      home: InputPage(),
    );
  }
}




