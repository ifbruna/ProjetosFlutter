import 'package:flutter/material.dart';

class Receita extends StatelessWidget {
  const Receita({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Receita de Bolo de Cenoura'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Imagem da Receita
            SizedBox(
              height: size.height * 0.3,
              child: Image.asset(
                'assets/images/bolo_cenoura.jpg', // Verifique o caminho de imagem
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 20),

            // Pontuação da Receita (Row de estrelas)
            Row(
              children: [
                for (int i = 0; i < 4; i++)
                  Icon(Icons.star, color: colorScheme.primary, size: 24),
                Icon(
                  Icons.star_half,
                  color: colorScheme.primary,
                  size: 24,
                ), // Meia estrela
                SizedBox(width: 8),
                Text('4.5 (250 avaliações)', style: TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 10),

            Section(title: "ingredientes:",
            itens: ["Cenouras, ovos, óleo, açúcar, farinha, fermento", 
            "cobertura: açúcar, chocolate em pó, manteiga"],),

            SizedBox(height: 20),

            // Seção do Modo de Preparo
            Section(title: "Modo de preparo:",
            numerado: true,
            itens: ["Bata cenoura, ovos e oleo no liquidificador.", 
            "Misture os liquidos com açúcar e farinha. Adicione o fermento por ultimo.", 
            "Asse em forno medio (180) por 30-40 minutos.", 
            "Para cobertura: cozinhe todos os ingredientes em fogo baixo ate engrossar. Despeje sobre o bolo quente."])

          ],
        ),
      ),
    );
  }
}


class Section extends StatelessWidget {
  const Section({super.key, required this.title, required this.itens, this.numerado = false});

  final String title;
  final List<String> itens;
  final bool numerado;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return // Seção de Ingredientes
      Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.tertiary,
                  ),
                ),

                const SizedBox(height: 10),

                // Lista de items
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var (i, item) in itens.indexed)
                      Item(
                        text: item,
                        icon: Icons.square,
                        numerado: numerado,
                        index: i + 1,
                      ),
                  ]
                ),
              ],
            );
  }
}

class Item extends StatelessWidget {
  const Item({super.key, required this.text, required this.icon, this.numerado = false, this.index});

  final String text;
  final IconData icon;
  final bool numerado;
  final int? index;

@override
Widget build(BuildContext context) {
  return Row(
    children: [
      if (numerado)
        Text('$index.',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        )
      else
        Icon(
          icon,
          size: 8,
          color: Theme.of(context).colorScheme.primary,
        ),
      const SizedBox(width: 4),
      Expanded(child: Text(text)),
    ],
  );
}
}

