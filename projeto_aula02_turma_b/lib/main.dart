import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 194, 8, 194)),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var _countRandom = 0;

  final _listaMensagemBiscoito = [
    "sorte deve estar com voce", 
    "bem preparada mente a sorte favorece", 
    "forte são os programadores", 
    "aprender dart você deve", 
    "obrigados ninguém é, você acreditar",
    'gostar do yoda eu gosto'
  ];

  void _incrementCounter() {
    setState(() {
        _counter++;
      if(_counter >= _listaMensagemBiscoito.length ){
        _counter = 0;
      }

    });
  }


void _sorteio () {
  setState(() {
  _countRandom = Random().nextInt(_listaMensagemBiscoito.length);
  });
  debugPrint(_countRandom.toString());
 }



  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      
        title: Text(widget.title),
      ),
      body: Center(
       
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('voce abriu seu biscoito da sorte'),
            Text(
              _listaMensagemBiscoito[_countRandom],
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sorteio,
        tooltip: 'Increment',
        child: const Icon(Icons.favorite,
      color: Colors.pink),
      ),
    );
  }
}
