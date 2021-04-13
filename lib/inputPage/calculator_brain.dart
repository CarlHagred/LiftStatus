import 'dart:math';

class CalculatorBrain {
  final int height;
  final int weight;

  CalculatorBrain({this.height, this.weight});

  double _bmi;

  String calculateBMI() {
    double _bmi = (weight / pow(height / 100, 2));
    return _bmi.toStringAsFixed(1);
  }

  String getResault() {
    if (_bmi >= 25) {
      return 'overweight';
    } else if (_bmi >= 18.5) {
      return 'normal';
    } else {
      return 'underweight';
    }
  }
}
