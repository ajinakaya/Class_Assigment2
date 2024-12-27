import 'package:class_assigment2/cubit/area_of_circle_cubit.dart';
import 'package:class_assigment2/cubit/dashboard_cubit.dart';
import 'package:class_assigment2/cubit/simple_interest_cubit.dart';
import 'package:class_assigment2/view/dashboard_cubit_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override


  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AreaOfCircleCubit()),
        BlocProvider(create: (context) => SimpleInterestCubit()),

        BlocProvider(
          create: (context) => DashboardCubit(
            context.read<AreaOfCircleCubit>(),
            context.read<SimpleInterestCubit>(),
          ),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Bloc',
        home: DashboardView(),
      ),
    );
  }
}