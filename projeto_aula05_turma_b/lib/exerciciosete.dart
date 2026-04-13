import 'package:flutter/material.dart';

class ExercicioSete extends StatelessWidget {
  const ExercicioSete({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Column(
        children: [
          Container(
            height: size.height * 0.15,
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(40),
              ),
              color: Theme.of(context).colorScheme.primary,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Olá, esse é o exercicio sete",
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
                  backgroundColor: Theme.of(
                    context,
                  ).colorScheme.primaryContainer,
                ),
                onPressed: () {},
                child: Text(
                  "Mais",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          SizedBox(
            height: size.height * 0.5,
            child: ListView(
              padding: const EdgeInsets.all(10),
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  width: size.width * 0.4,
                  margin: const EdgeInsets.only(right: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/images/gatoprogramador.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Container(
                  width: size.width * 0.4,
                  margin: const EdgeInsets.only(right: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/images/gatomatero.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Container(
                  width: size.width * 0.4,
                  margin: const EdgeInsets.only(right: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/images/gatochimarrao.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Container(
                  width: size.width * 0.4,
                  margin: const EdgeInsets.only(right: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/images/cachorrodesconfiado.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/images/icon.png', width: 25, height: 25),
                const Text('Eu amo o flutter!'),
              ],
            ),
          ),
          const Spacer(), // mesma coisa que Expanded(child: SizedBox())
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('desenvolvimento de aplicativos')],
          ),
        ],
      ),
    );
  }
}
