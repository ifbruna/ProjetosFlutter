import 'package:flutter/material.dart';
import 'package:projeto_aula07_turma_b/views/exerciciotres.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stateless Widget',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const Exerciciotres(),
    );
  }
}

class GradeHoraria extends StatelessWidget {
  const GradeHoraria({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grade horária'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        centerTitle: true,
      ),
      body: const Column(
        children: [
          Componente(nome: 'Desenvolvimento de aplicativos'),
          Componente(nome: 'Desenvolvimento web'),
          Componente(nome: 'Matemática'),
        ],
      ),
    );
  }
}

class Componente extends StatefulWidget {
  final String nome;

  const Componente({super.key, required this.nome});

  @override
  State<Componente> createState() => _ComponenteState();
}

class _ComponenteState extends State<Componente> {
  int aulas = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.school),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(widget.nome.toUpperCase()),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              aulas++;
            });
          },
          child: Text('$aulas aulas'),
        ),
      ],
    );
  }
}
