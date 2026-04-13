import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', home: const ExercicioSete());
  }
}

class ExercicioUm extends StatelessWidget {
  const ExercicioUm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aula 4 - exercicio 1"),
        backgroundColor: Color.fromARGB(255, 255, 147, 250),
      ),
      body: const Center(child: Text("Hello world")),
    );
  }
}

class ExercicioDois extends StatelessWidget {
  const ExercicioDois({super.key});

  String getFullName(String nome, String sobrenome) {
    return "$sobrenome, $nome";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aula 4 - exercicio 2"),
        backgroundColor: Color.fromARGB(255, 255, 147, 250),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("hello world"),
            Text(getFullName("Bruna", "Farias")),
          ],
        ),
      ),
    );
  }
}

class ExercicioTres extends StatelessWidget {
  const ExercicioTres({super.key});

  String getFullName(String nome, String sobrenome) {
    return "$nome ${sobrenome.toUpperCase()}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aula 4 - exercicio 3"),
        backgroundColor: Color.fromARGB(255, 255, 147, 250),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("hello world"),
            SizedBox(width: 10),
            Text(getFullName("Bruna", "Farias")),
          ],
        ),
      ),
    );
  }
}

class ExercicioQuatro extends StatelessWidget {
  const ExercicioQuatro({super.key});

  String getFullName(String nome, String sobrenome) {
    return "$nome ${sobrenome.toUpperCase()}";
  }

  String getData() {
    DateTime agora = DateTime.now();
    return DateFormat('dd/MM/yyyy').format(agora);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aula 4 - exercicio 4"),
        backgroundColor: Color.fromARGB(255, 255, 147, 250),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(getFullName("Bruna", "Farias")),
              SizedBox(width: 30),
              Text(getData()),
            ],
          ),
          Expanded(child: Center(child: Text("Hello World"))),
        ],
      ),
    );
  }
}

class ExercicioCinco extends StatelessWidget {
  const ExercicioCinco({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aula 4 - exercicio 5"),
        backgroundColor: Color.fromARGB(255, 255, 147, 250),
      ),
      body: Row(
        children: [
          Icon(Icons.account_circle_rounded),
          SizedBox(width: 20),
          Expanded(
            child: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text("Nome"), Text("Telefone")],
              ),
            ),
          ),
          Icon(Icons.phone),
        ],
      ),
    );
  }
}

class ExercicioSeis extends StatelessWidget {
  const ExercicioSeis({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aula 4 - exercicio 6"),
        backgroundColor: Color.fromARGB(255, 255, 147, 250),
      ),
      body: Container(
        padding: EdgeInsets.all(
          5,
        ), // padding é referente ao interno do espaçamento do container
        margin: EdgeInsets.all(
          10,
        ), // margin é referente ao externo do espaçamento container
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 221, 221, 221),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Icon(Icons.search),
            Expanded(child: Text("Pesquisar...")),
          ],
        ),
      ),
    );
  }
}

class ExercicioSete extends StatelessWidget {
  const ExercicioSete({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Aula 4 - exercicio 7"),
        backgroundColor: Color.fromARGB(255, 255, 147, 250),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(
              5,
            ), // padding é referente ao interno do espaçamento do container
            margin: EdgeInsets.all(
              10,
            ), // margin é referente ao externo do espaçamento container
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 221, 221, 221),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              children: [
                Icon(Icons.search),
                Expanded(child: Text("Pesquisar...")),
              ],
            ),
          ),

          Row(
            children: [
              Icon(Icons.account_circle_rounded),
              SizedBox(width: 20),
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text("Nome"), Text("Telefone")],
                  ),
                ),
              ),
              Icon(Icons.phone),
            ],
          ),
        ],
      ),
    );
  }
}
