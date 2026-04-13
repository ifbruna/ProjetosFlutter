import 'package:flutter/material.dart';

class ExercicioCinco extends StatelessWidget {
  const ExercicioCinco({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),

        backgroundColor: const Color.fromARGB(255, 56, 116, 71),
      ),
      body: Column(
        children: [
          Container(
            width: size.width,
            padding: const EdgeInsets.all(20.0),
            height: size.height * 0.15,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
              color: Color.fromARGB(255, 56, 116, 71),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Olá, esse é o exercicio cinco",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Icon(Icons.woman),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            spacing: 180,
            children: [
              const Text("Recomendados"),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 153, 194, 164),
                ),
                onPressed: () {},
                child: const Text(
                  "Mais",
                  style: TextStyle(color: Color.fromARGB(255, 45, 92, 64)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
