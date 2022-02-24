part of 'calculator_bloc.dart';

@immutable
abstract class CalculatorEvent {}

class AddNumber extends CalculatorEvent {
  final String number;
  AddNumber(
    this.number,
  );
}

class ResetAC extends CalculatorEvent {}

class Delete extends CalculatorEvent {}

class ChangePositiveNegative extends CalculatorEvent {}

class Equal extends CalculatorEvent {}

class Operation extends CalculatorEvent {
  final String operation;

  Operation(
    this.operation,
  );
}
