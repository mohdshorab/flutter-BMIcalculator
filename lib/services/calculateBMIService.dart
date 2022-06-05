import 'dart:math';

class CalculateBMI {
  final double height;
  final double weight;

// constructor for input
  CalculateBMI(this.height, this.weight);
  double _bmi = 0;

  String getTheBmi() {
    _bmi = weight / pow((height / 100), 2);
    return _bmi.toStringAsFixed(1);
  }

  String getWeightLevel() {
    String weightLevel = 'Normal';
    if (_bmi < 18.5) weightLevel = 'Under Weight';
    if (_bmi > 18.5 && _bmi <= 24.9) weightLevel = 'Normal';
    if (_bmi >= 25 && _bmi <= 29.9) weightLevel = 'Over Weight';
    if (_bmi > 30 && _bmi <= 39.9) weightLevel = 'Obesity';
    if (_bmi >= 40) weightLevel = 'Severe Obesity';
    return weightLevel;
  }

  String getNarration() {
    String narration = '';
    if (_bmi < 18.5) {
      narration = 'You are currently under weight, Eat Healthy Food';
    }
    if (_bmi > 18.5 && _bmi <= 24.9) {
      narration = 'Your BMI is normal, Maintain the Same Diet';
    }
    if (_bmi >= 25 && _bmi <= 29.9) {
      narration =
          'Oops! Your BMI states slightly Over Weight, Eat Healthy Food';
    }
    if (_bmi > 30 && _bmi <= 39.9) {
      narration =
          'Oops! Your BMI States Obesity, Avoid Junk Food and Eat Healthy Food';
    }
    if (_bmi >= 40) {
      narration =
          'Oops!, You BMI States Severe Obesity, Avoid Junk Food else you will die';
    }
    return narration;
  }
}
