import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorState()) {
    on<CalculatorEvent>((event, emit) {
      if (event is ResetAC) {
        _resetAC(emit);
      } else if (event is AddNumber) {
        _addNumber(emit, event);
      } else if (event is ChangePositiveNegative) {
        _changePositiveNegative(emit);
      } else if (event is Delete) {
        _delete(emit);
      } else if (event is Operation) {
        _operation(emit, event);
      } else if (event is Equal) {
        _equal(emit);
      }
    });
  }

  void _addNumber(Emitter<CalculatorState> emit, AddNumber event) {
    String number = '';
    if (event.number == '.') {
      if (state.mathResult.contains('.')) {
        number = state.mathResult;
      } else {
        number = state.mathResult + event.number;
      }
    } else if (event.number == '00') {
      if (state.mathResult == '0') {
        number = '0.0';
      } else {
        number = state.mathResult + event.number;
      }
    } else if (state.mathResult == '0') {
      number = event.number;
    } else {
      number = state.mathResult + event.number;
    }

    return emit(
      state.copyWith(mathResult: number),
    );
  }

  void _operation(Emitter<CalculatorState> emit, Operation event) {
    double result = 0;
    if (state.firstNumber == '0') {
      result = double.parse(state.mathResult);
    } else {
      if (state.secondNumber == '0') {
        result = _calculate(state.firstNumber, state.mathResult);
      } else {
        result = _calculate(
            state.firstNumber.toString(), state.secondNumber.toString());
      }
    }

    return emit(
      state.copyWith(
        operation: event.operation,
        firstNumber: result.toString(),
        mathResult: '0',
        secondNumber: '0',
      ),
    );
  }

  void _changePositiveNegative(Emitter<CalculatorState> emit) {
    return emit(
      state.copyWith(
          mathResult: (state.mathResult.contains('-'))
              ? state.mathResult.replaceFirst('-', '')
              : '-' + state.mathResult),
    );
  }

  void _equal(Emitter<CalculatorState> emit) {
    final result = _calculate(state.firstNumber, state.mathResult);

    return emit(
      state.copyWith(
        secondNumber: state.mathResult,
        mathResult: result.toString(),
      ),
    );
  }

  double _calculate(String num1, String num2) {
    final double numero1 = double.parse(num1);
    final double numero2 = double.parse(num2);
    double result = 0.0;
    switch (state.operation) {
      case '+':
        result = numero1 + numero2;
        break;
      case '-':
        result = numero1 - numero2;
        break;
      case '/':
        result = numero1 / numero2;
        break;
      case 'X':
        result = numero1 * numero2;
        break;
      default:
    }

    return result;
  }

  void _delete(Emitter<CalculatorState> emit) {
    return emit(
      state.copyWith(
        mathResult: (state.mathResult.length > 1)
            ? state.mathResult.substring(0, state.mathResult.length - 1)
            : '0',
      ),
    );
  }

  void _resetAC(Emitter<CalculatorState> emit) {
    return emit(
      CalculatorState(
        firstNumber: '0',
        mathResult: '0',
        operation: '',
        secondNumber: '0',
      ),
    );
  }
}
