import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:class_assigment2/cubit/arithmetic_cubit.dart';

class ArithmeticCubitView extends StatelessWidget {
  const ArithmeticCubitView({super.key});

  @override
  Widget build(BuildContext context) {
    final firstController = TextEditingController();
    final secondController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajina Arithmetic'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Enter Numbers',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: firstController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'First Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),

                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: secondController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Second Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),

                ),
              ),
              const SizedBox(height: 20),
              BlocBuilder<ArithmeticCubit, int>(
                builder: (context, result) {
                  return Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Result: ',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '$result',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    final firstNumber = int.tryParse(firstController.text) ?? 0;
                    final secondNumber =
                        int.tryParse(secondController.text) ?? 0;
                    context.read<ArithmeticCubit>().add(firstNumber, secondNumber);
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Addition'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    final firstNumber = int.tryParse(firstController.text) ?? 0;
                    final secondNumber =
                        int.tryParse(secondController.text) ?? 0;
                    context.read<ArithmeticCubit>().subtract(firstNumber, secondNumber);
                  },
                  icon: const Icon(Icons.remove),
                  label: const Text('Subtraction'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    final firstNumber = int.tryParse(firstController.text) ?? 0;
                    final secondNumber =
                        int.tryParse(secondController.text) ?? 0;
                    context.read<ArithmeticCubit>().multiply(firstNumber, secondNumber);
                  },
                  icon: const Icon(Icons.close),
                  label: const Text('Multiply'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    context.read<ArithmeticCubit>().reset();
                    firstController.clear();
                    secondController.clear();
                  },
                  icon: const Icon(Icons.refresh),
                  label: const Text('Reset'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),

                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
