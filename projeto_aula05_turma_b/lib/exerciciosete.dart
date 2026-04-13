import 'package:flutter/material.dart';

class ExercicioSete extends StatelessWidget {
  const ExercicioSete({super.key});

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
            height: size.height * 0.15,
            padding: const EdgeInsets.all(20.0),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
              color: Color.fromARGB(255, 56, 116, 71),
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
