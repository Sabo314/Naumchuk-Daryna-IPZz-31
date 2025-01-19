import 'calc.dart';

void main() {
  final processor = Calc( -5.0, 5.0, step: 0.25);

  processor.setVerbose(true);
  processor.runCalc();
  print(processor.result);
}
