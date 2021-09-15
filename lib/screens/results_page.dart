import 'package:bmi_calculator/components/constants.dart';
import 'package:flutter/material.dart';
import '../components/constants.dart';
import '../components/resuable_card.dart';
import '../components/bottomButton.dart';

class ResultsPage extends StatelessWidget {
  final String? bmiResults;
  final String? resultText;
  final String? interpretation;

  ResultsPage({this.bmiResults, this.resultText, this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator', style: kLargeButtonTextStyle,),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text('Your Result', style: kTitleTextStyle,),
            ),),
            Expanded(
              flex: 5,
              child: ResuableCard(
                colour: kcardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(resultText.toString(), style: kReusltsTextStyle,),
                    Text(bmiResults.toString(), style: kBMITextStyle,),
                    Text(interpretation.toString(),
                      textAlign: TextAlign.center,
                      style: kBodyTextStyle,),
                  ],
                ),
              ),
            ),
            BottomButton(
              buttonString: 'RECALCULATE',
              taped: (){
                Navigator.pop(context);
              },
            ),
          ],
        )
      );
  }
}
