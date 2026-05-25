import 'package:flutter/material.dart';

class Exercicioum extends StatelessWidget {
  const Exercicioum({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(padding: EdgeInsets.all(16), child: Calculadora()),
    );
  }
}

class Calculadora extends StatefulWidget {
  const Calculadora({super.key});

  @override
  State<Calculadora> createState() => _CalculadoraState();
}

class _CalculadoraState extends State<Calculadora> {
  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  double resultado = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextField(
          controller: controller1,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Primeiro número',
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          controller: controller2,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Segundo número',
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            setState(() {
              resultado =
                  double.parse(controller1.text) +
                  double.parse(controller2.text);
            });
          },
          child: const Text('Somar'),
        ),
        const SizedBox(height: 16),
        Text('Resultado: $resultado'),
      ],
    );
  }
}
