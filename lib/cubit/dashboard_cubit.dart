import 'package:class_assigment2/cubit/area_of_circle_cubit.dart';
import 'package:class_assigment2/cubit/simple_interest_cubit.dart';
import 'package:class_assigment2/view/area_of_circle_cubit_view.dart';
import 'package:class_assigment2/view/simple_interest_cubit_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DashboardCubit extends Cubit<void> {
  DashboardCubit(
      this._areaOfCircleCubit,
      this._simpleInterestCubit,
      ) :super (null);

  final AreaOfCircleCubit _areaOfCircleCubit;
  final SimpleInterestCubit _simpleInterestCubit;


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
}