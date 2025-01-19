import 'dart:math';

class Calc {
  bool verbose = false;
  double? _result;

  late double rangeFrom;
  late double rangeTo;
  late double step;

  double min = double.infinity;
  double max = double.negativeInfinity;

  /// Constructor
  Calc(this.rangeFrom, this.rangeTo, {this.step = 0.25});

  /// Methods

  // result getter. Might be equal to null if there are no results
  double? get result => _result;

  // setVerbose sets the value of the 'verbose' flag
  setVerbose(bool value) {
    verbose = value;
  }

  // setRange allows changing the range of the tabulation
  setRange(double from, double to) {
    rangeFrom = from;
    rangeTo = to;
  }

  // runCalc launches the calculation process
  runCalc() {
    var x = rangeFrom;
    var count = 0;
    double sum = 0.0;

    for (x; x < rangeTo; x += step) {
      final y = _calc(x);
      
      if (verbose) {
        print("x = $x, y = $y");
      }

      // Find minimum and maximum value
      if (y < min) min = y;
      if (y > max) max = y;

      count++;
      sum += y;
    }

    _result = sum;
    
    print("\nРезультати:");
    print("Мінімальне значення функції: $min");
    print("Максимальне значення функції: $max");
  }

  // _calc performs the actual equation calculations
  double _calc(double x) {
    return x * x * x - x * x - x; // Function y = x^3 - x^2 - x
  }
}
