import 'package:class_assigment2/cubit/simple_interest_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleInterestCubitView extends StatelessWidget {
  const SimpleInterestCubitView({super.key});

  @override
  Widget build(BuildContext context) {
    final principalController = TextEditingController();
    final rateController = TextEditingController();
    final timeController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajina Simple Interest'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: principalController,
                decoration: const InputDecoration(
                    labelText: 'Principal Amount', border: OutlineInputBorder()),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: rateController,
                decoration: const InputDecoration(
                    labelText: 'Rate of Interest (%)',
                    border: OutlineInputBorder()),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: timeController,
                decoration: const InputDecoration(
                    labelText: 'Time (Years)', border: OutlineInputBorder()),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              BlocBuilder<SimpleInterestCubit, double>(
                builder: (context, result) {
                  return Text(
                    'Simple Interest: ${result.toStringAsFixed(2)}', // Rounded to 2 decimal places
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  );
                },
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    final principal =
                        double.tryParse(principalController.text) ?? 0;
                    final rate = double.tryParse(rateController.text) ?? 0;
                    final time = double.tryParse(timeController.text) ?? 0;
                    context
                        .read<SimpleInterestCubit>()
                        .calculateInterest(principal, rate, time);
                  },
                  child: const Text('Calculate Interest'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
