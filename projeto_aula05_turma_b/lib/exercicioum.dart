import 'package:flutter/material.dart';

class ExercicioUm extends StatelessWidget {
  const ExercicioUm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aula 5 - exercício 1"),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Column(
        children: [
          const Text("Bem-vindo usuário"),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset('assets/images/bubasauro.png'),
          ),
        ],
      ),
    );
  }
}
