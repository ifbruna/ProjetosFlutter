import 'package:flutter/material.dart';
import 'package:projeto_aula09_turma_b/database/productdao.dart';
import 'package:projeto_aula09_turma_b/modals/product.dart';
import 'package:projeto_aula09_turma_b/views/add_product.dart';
import 'package:projeto_aula09_turma_b/views/product_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void deleteProduct(Product product) {
    setState(() {
      Productdao.instance.remove(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ToBuy'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddProduct()),
          );
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),

      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: Productdao.instance.getProduct(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return snapshot.data!.isEmpty
                      ? const Center(child: Text("Nenhum produto"))
                      : ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            Product currentProduct = snapshot.data![index];
                            return ProductItem(
                              product: currentProduct,
                              deleteItem: () => deleteProduct(currentProduct),
                            );
                          },
                        );
                } else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
