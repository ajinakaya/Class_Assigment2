import 'package:class_assigment2/cubit/area_of_circle_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AreaOfCircleCubitView extends StatelessWidget {
  const AreaOfCircleCubitView({super.key});

  @override
  Widget build(BuildContext context) {
    final radiusController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajina Area of Circle'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                controller: radiusController,
                decoration: const InputDecoration(
                    labelText: 'Radius', border: OutlineInputBorder()
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              BlocBuilder<AreaOfCircleCubit, double>(
                builder: (context, area) {
                  return Text(
                    'Area: ${area.toStringAsFixed(2)}',
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
                    final radius = double.tryParse(radiusController.text) ?? 0;
                    context.read<AreaOfCircleCubit>().calculateArea(radius);
                  },
                  child: const Text('Calculate Area'),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
