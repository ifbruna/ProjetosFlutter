import 'package:flutter/material.dart';
import 'package:projeto_aula09_turma_b/modals/product.dart';

class ProductItem extends StatefulWidget {
  final Product product;
  final Function() deleteItem;
  const ProductItem({
    super.key,
    required this.product,
    required this.deleteItem,
  });

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.all(8),
      child: ListTile(
        leading: widget.product.buyed
            ? const Icon(Icons.shopping_bag)
            : const Icon(Icons.shopping_bag_outlined),
        tileColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text(widget.product.name),
        titleTextStyle: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        subtitle: Text(widget.product.name),
        onTap: () {
          setState(() {
            widget.product.buy();
          });
          Productdao.instance.update(widget.product);
        },
        trailing: Wrap(
          children: [
            IconButton(
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddProduct(product: widget.product),
                  ),
                );
                setState(() {});
              },
              icon: const Icon(Icons.edit),
            ),
            IconButton(
              onPressed: widget.deleteItem,
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
