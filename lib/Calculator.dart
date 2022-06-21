import 'dart:math';

class Calculator {
  int? height;
  int? weight;
  double? _bmi;
  Calculator({this.height, this.weight});

  String CalculateBMI() {
    _bmi = weight! / pow((height! / 100), 2);
    return _bmi!.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi! >= 25) {
      return 'OverWeight';
    } else if (_bmi! > 18.5) {
      return 'Normal';
    } else {
      return 'UnderWeight';
    }
  }
  String getInterpretation() {
    if (_bmi! >= 25) {
      return 'You have a higher than the normal body weight.Try to exercise more.';
    } else if (_bmi! > 18.5) {
      return 'You have a normal body weight. Good Job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}
