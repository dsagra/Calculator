import 'package:calculadora/src/app/app.dart';
import 'package:calculadora/src/calculator/controller/bloc/calculator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => CalculatorBloc(),
      ),
    ], child: App());
  }
}
