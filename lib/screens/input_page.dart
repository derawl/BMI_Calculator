import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/Icon_content.dart';
import '../components/resuable_card.dart';
import '../components/constants.dart';
import 'results_page.dart';
import '../components/bottomButton.dart';
import 'package:bmi_calculator/calculator.dart';

enum Gender{male, female}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 56;
  int age = 14;


  Color maleCardColor = kinactiveCardColor;
  Color femaleCardColor = kinactiveCardColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ResuableCard(
                    onPress: (){
                     setState(() {
                       selectedGender = Gender.male;
                     });
                    },
                    colour: selectedGender == Gender.male ? kcardColor : kinactiveCardColor,
                    cardChild: iconCard(
                      genderIcon: FontAwesomeIcons.mars,
                      genderText: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: ResuableCard(
                    onPress: (){
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female? kcardColor:kinactiveCardColor,
                    cardChild: iconCard(
                      genderText: 'Female',
                      genderIcon: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ResuableCard(
                  colour: kcardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('HEIGHT', style: kgenderTextStyle,),
                      Row(
                        mainAxisAlignment:  MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(height.toString(), style: kFontStyleSliderArea,),
                          Text('cm', style: kgenderTextStyle,),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          thumbColor: kbottomContaineColor,
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
                          activeTrackColor: Colors.white,
                          overlayColor: Color(0X29EB1555),
                          inactiveTrackColor: kinactiveCardColor,
                        ),
                        child: Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max: 220.0,
                            onChanged:(double newHeight){
                              setState(() {
                                print(newHeight);
                                height = newHeight.round();
                              });
                            }
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: ResuableCard(
                  colour: kcardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('WEIGHT', style: kgenderTextStyle,),
                      Text(weight.toString(), style: kFontStyleSliderArea,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            child: FontAwesomeIcons.plus,
                            update: (){
                              setState(() {
                                weight += 1;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            child: FontAwesomeIcons.minus,
                            update: (){
                              setState(() {
                                if(weight > 0){
                                  weight -= 1;
                                }
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ResuableCard(
                  colour: kcardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('AGE', style: kgenderTextStyle,),
                      Text(age.toString(), style: kFontStyleSliderArea,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            child: FontAwesomeIcons.plus,
                            update: (){
                              setState(() {
                                age += 1;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            child: FontAwesomeIcons.minus,
                            update: (){
                              setState(() {
                                if(age > 0){
                                  age -= 1;
                                }
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          ),
          BottomButton(
            buttonString: 'CALCULATE',
            taped: (){
              CalculatorBrian calc = CalculatorBrian(height, weight);
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return ResultsPage(
                  bmiResults: calc.CalculateBMI(),
                  resultText: calc.getResult(),
                  interpretation: calc.getInterpretation(),
                );
              }));
            },
          )
        ],
      ),
    );
  }
}




class RoundIconButton extends StatelessWidget {

  final IconData? child;
  final VoidCallback? update;

  RoundIconButton({this.child, this.update});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: update,
      elevation: 2.0,
      constraints: BoxConstraints(minWidth: 56.0, minHeight: 56.0),
      shape: CircleBorder(),
      fillColor: Color(0xFF4c4F5E),
      child: Icon(child)

    );
  }
}
