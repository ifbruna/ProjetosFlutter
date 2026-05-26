import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'exerciciodois.dart';
import 'exerciciotres.dart';
import 'exercicioum.dart';

class Exerciciocinco extends StatefulWidget {
  const Exerciciocinco({super.key});

  @override
  State<Exerciciocinco> createState() => _ExerciciocincoState();
}

int indiceAtual = 0;

final List<Widget> telas = [
  Center(child: Lottie.asset('assets/rainbow.json')),
  const Exercicioum(),
  const Exerciciodois(),
  const Exerciciotres(),
];

class _ExerciciocincoState extends State<Exerciciocinco> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('homepage'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: telas[indiceAtual],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.onSurface,
        currentIndex: indiceAtual,
        onTap: (indice) {
          setState(() {
            indiceAtual = indice;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'animação'),
          BottomNavigationBarItem(icon: Icon(Icons.calculate), label: 'soma'),
          BottomNavigationBarItem(
            icon: Icon(Icons.sentiment_satisfied_alt_rounded),
            label: 'sentimento',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.text_format_rounded),
            label: 'texto',
          ),
        ],
      ),
    );
  }
}
