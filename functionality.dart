import 'dart:math';

class Functionality {
  final int height;
  final int weight;

  double _bmi = 0; // private variable

  Functionality({required this.height, required this.weight});

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation(){
    if (_bmi >= 25) {
      return 'You are fat. Exercise more.';
    } else if (_bmi > 18.5) {
      return 'You are normal. Well Done.';
    } else {
      return 'You are skinny. Eat some more.';
    }
  }
}
