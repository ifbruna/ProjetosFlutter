import 'package:flutter/material.dart';

class Exerciciotres extends StatelessWidget {
  const Exerciciotres({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tempo real'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: const Padding(
        padding: EdgeInsetsGeometry.all(40),
        child: Realtime(),
      ),
    );
  }
}

class Realtime extends StatefulWidget {
  const Realtime({super.key});

  @override
  State<Realtime> createState() => _RealtimeState();
}

class _RealtimeState extends State<Realtime> {
  String texto = "";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onChanged: (value) {
            setState(() {
              texto = value;
            });
          },
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Digite algo',
          ),
        ),
        const SizedBox(height: 20),
        Text(texto, style: const TextStyle(fontSize: 30)),
      ],
    );
  }
}
