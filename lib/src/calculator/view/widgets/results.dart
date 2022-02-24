import 'package:calculadora/src/calculator/view/widgets/main_result.dart';
import 'package:calculadora/src/calculator/view/widgets/sub_result.dart';
import 'package:flutter/material.dart';

import 'separator.dart';

class Results extends StatelessWidget {
  const Results({
    Key? key,
    required String mathResult,
    required String firstNumber,
    required String secondNumber,
    required String operation,
  })  : _mathResult = mathResult,
        _firstNumber = firstNumber,
        _secondNumber = secondNumber,
        _operation = operation,
        super(key: key);

  final String _mathResult;
  final String _firstNumber;
  final String _secondNumber;
  final String _operation;

  @override
  Widget build(BuildContext context) {
    return (_firstNumber == '0' && _operation == '')
        ? MainResultText(
            text: _mathResult.endsWith('.0')
                ? _mathResult.substring(0, _mathResult.length - 2)
                : _mathResult)
        : Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SubResult(
                      text: _firstNumber.endsWith('.0')
                          ? _firstNumber.substring(0, _firstNumber.length - 2)
                          : _firstNumber),
                  SubResult(text: _operation),
                  SubResult(
                      text: _secondNumber.endsWith('.0')
                          ? _secondNumber.substring(0, _secondNumber.length - 2)
                          : _secondNumber),
                ],
              ),
              Separator(),
              MainResultText(
                  text: _mathResult.endsWith('.0')
                      ? _mathResult.substring(0, _mathResult.length - 2)
                      : _mathResult),
            ],
          );
  }
}
