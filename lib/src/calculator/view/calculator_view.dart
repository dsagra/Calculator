import 'package:calculadora/src/calculator/controller/bloc/calculator_bloc.dart';
import 'package:calculadora/src/calculator/view/widgets/button.dart';
import 'package:calculadora/src/calculator/view/widgets/results.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final calculatorBloc = BlocProvider.of<CalculatorBloc>(context);
    return Scaffold(
        body: SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: Container(),
            ),
            BlocBuilder<CalculatorBloc, CalculatorState>(
              builder: (context, state) {
                return Results(
                  firstNumber: state.firstNumber,
                  secondNumber: state.secondNumber,
                  mathResult: state.mathResult,
                  operation: state.operation,
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Button(
                  text: 'AC',
                  bgColor: Colors.grey,
                  onPressed: () => calculatorBloc.add(ResetAC()),
                ),
                Button(
                  text: '+/-',
                  bgColor: Colors.grey,
                  onPressed: () => calculatorBloc.add(ChangePositiveNegative()),
                ),
                Button(
                  text: 'del',
                  bgColor: Colors.grey,
                  onPressed: () => calculatorBloc.add(Delete()),
                ),
                Button(
                  text: '/',
                  bgColor: Colors.orange,
                  onPressed: () => calculatorBloc.add(Operation('/')),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Button(
                  text: '7',
                  onPressed: () => calculatorBloc.add(
                    AddNumber('7'),
                  ),
                ),
                Button(
                  text: '8',
                  onPressed: () => calculatorBloc.add(
                    AddNumber('8'),
                  ),
                ),
                Button(
                  text: '9',
                  onPressed: () => calculatorBloc.add(
                    AddNumber('9'),
                  ),
                ),
                Button(
                  text: 'X',
                  bgColor: Colors.orange,
                  onPressed: () => calculatorBloc.add(Operation('X')),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Button(
                  text: '4',
                  onPressed: () => calculatorBloc.add(
                    AddNumber('4'),
                  ),
                ),
                Button(
                  text: '5',
                  onPressed: () => calculatorBloc.add(
                    AddNumber('5'),
                  ),
                ),
                Button(
                  text: '6',
                  onPressed: () => calculatorBloc.add(
                    AddNumber('6'),
                  ),
                ),
                Button(
                  text: '-',
                  bgColor: Colors.orange,
                  onPressed: () => calculatorBloc.add(Operation('-')),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Button(
                  text: '1',
                  onPressed: () => calculatorBloc.add(
                    AddNumber('1'),
                  ),
                ),
                Button(
                  text: '2',
                  onPressed: () => calculatorBloc.add(
                    AddNumber('2'),
                  ),
                ),
                Button(
                  text: '3',
                  onPressed: () => calculatorBloc.add(
                    AddNumber('3'),
                  ),
                ),
                Button(
                  text: '+',
                  bgColor: Colors.orange,
                  onPressed: () => calculatorBloc.add(Operation('+')),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Button(
                  text: '0',
                  onPressed: () => calculatorBloc.add(
                    AddNumber('0'),
                  ),
                ),
                Button(
                  text: '00',
                  onPressed: () => calculatorBloc.add(
                    AddNumber('00'),
                  ),
                ),
                Button(
                  text: '.',
                  onPressed: () => calculatorBloc.add(
                    AddNumber('.'),
                  ),
                ),
                Button(
                    text: '=',
                    bgColor: Colors.orange,
                    onPressed: () => calculatorBloc.add(Equal())),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
