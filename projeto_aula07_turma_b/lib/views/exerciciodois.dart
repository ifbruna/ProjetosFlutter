import 'package:flutter/material.dart';

class Exerciciodois extends StatelessWidget {
  const Exerciciodois({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saudação'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: const Center(
        child: Padding(padding: EdgeInsets.all(16), child: Formulario()),
      ),
    );
  }
}

class Formulario extends StatefulWidget {
  const Formulario({super.key});

  @override
  State<Formulario> createState() => _FormularioState();
}

class _FormularioState extends State<Formulario> {
  final formKey = GlobalKey<FormState>();
  final nomeController = TextEditingController();
  final humorController = TextEditingController();
  bool mostrarResultado = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: nomeController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Seu nome',
              ),
              validator: (valor) {
                if (valor == null || valor.isEmpty) {
                  return 'Por favor, insira seu nome!';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: humorController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Como você está se sentindo?',
              ),
              validator: (valor) {
                if (valor == null || valor.isEmpty) {
                  return 'Por favor, diga como está se sentindo!';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  setState(() {
                    mostrarResultado = true;
                  });
                }
              },
              child: const Text('Enviar'),
            ),
            const SizedBox(height: 24),
            Visibility(
              visible: mostrarResultado,
              child: Column(
                children: [
                  Text(
                    'Olá, ${nomeController.text}! Que bom saber que você está ${humorController.text}!',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 16),
                  Image.asset(
                    'assets/gatosorrindo.webp',
                    width: 200,
                    height: 200,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
