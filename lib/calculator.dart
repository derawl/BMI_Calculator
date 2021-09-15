import 'dart:math';
class CalculatorBrian{
  final int height;
  final int weight;
  double _bmi = 0.0;

  CalculatorBrian(this.height, this.weight);

   String CalculateBMI(){
     _bmi = weight / pow(height! / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
     if (_bmi >= 25){
       return 'Over weight';
     }else if (_bmi > 18.5){
       return 'Normal';
     }else{
       return 'Under weight';
     }
  }

  String getInterpretation(){
    if (_bmi >= 25){
      return 'Exercise More';
    }else if (_bmi > 18.5){
      return 'Good Job';
    }else{
      return 'Eat more';
    }
  }

}