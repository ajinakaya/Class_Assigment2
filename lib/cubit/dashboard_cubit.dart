import 'package:class_assigment2/cubit/area_of_circle_cubit.dart';
import 'package:class_assigment2/cubit/arithmetic_cubit.dart';
import 'package:class_assigment2/cubit/simple_interest_cubit.dart';
import 'package:class_assigment2/view/area_of_circle_cubit_view.dart';
import 'package:class_assigment2/view/arithmetic_cubit_view.dart';
import 'package:class_assigment2/view/simple_interest_cubit_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DashboardCubit extends Cubit<void> {
  DashboardCubit(
      this._areaOfCircleCubit,
      this._simpleInterestCubit,
      this._arithmeticCubit,
      ) :super (null);

  final AreaOfCircleCubit _areaOfCircleCubit;
  final SimpleInterestCubit _simpleInterestCubit;
  final ArithmeticCubit _arithmeticCubit;


  void openAreaOfCircleView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            BlocProvider.value(
              value: _areaOfCircleCubit,
              child: AreaOfCircleCubitView(),
            ),
      ),
    );
  }

  void openSimpleInterestView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            BlocProvider.value(
              value: _simpleInterestCubit,
              child: SimpleInterestCubitView(),
            ),
      ),
    );
  }

  void openArithmeticView(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            BlocProvider.value(
              value: _arithmeticCubit,
              child: ArithmeticCubitView(),
            ),
      ),
    );
  }
}