import 'package:flutter/material.dart';

class ExercicioTres extends StatelessWidget {
  const ExercicioTres({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aula 5 - exercício 3"),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Column(
        children: [
          const SizedBox(height: 60),
          const Text("Bubassauro", style: TextStyle(fontSize: 25)),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Image.asset('assets/images/bubasauro.png'),
          ),
          const SizedBox(height: 40),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15.0),
            decoration: BoxDecoration(
              border: Border.all(
                style: BorderStyle.solid,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 50,
              children: [
                Icon(Icons.star),
                Icon(Icons.star),
                Icon(Icons.star),
                Icon(Icons.star),
                Icon(Icons.star_border),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              spacing: 150,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Theme.of(
                      context,
                    ).colorScheme.primaryContainer,
                  ),
                  onPressed: () {},
                  child: Text(
                    "Anterior",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Theme.of(
                      context,
                    ).colorScheme.primaryContainer,
                  ),
                  onPressed: () {},
                  child: Text(
                    "Próximo",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
