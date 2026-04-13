import 'package:flutter/material.dart';

class ExercicioDois extends StatelessWidget {
  const ExercicioDois({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aula 5 - exercício 2"),
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
          const Row(
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
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Anterior",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                TextButton(
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
