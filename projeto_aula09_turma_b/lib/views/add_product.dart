import 'package:flutter/material.dart';
import 'package:projeto_aula09_turma_b/database/productdao.dart';
import 'package:projeto_aula09_turma_b/modals/product.dart';

class AddProduct extends StatefulWidget {
  final Product? product;

  const AddProduct({super.key, this.product});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _produtoName = TextEditingController();
  final TextEditingController _produtoAmount = TextEditingController();
  final TextEditingController _produtoPrice = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.product != null) {
      _produtoName.text = widget.product!.name;
      _produtoAmount.text = widget.product!.amount.toString();
      _produtoPrice.text = widget.product!.price.toString();
    }
  }

  @override
  void dispose() {
    _produtoName.dispose();
    _produtoAmount.dispose();
    _produtoPrice.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: widget.product == null
            ? const Text("Novo produto")
            : const Text('Alterando o produto'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _produtoName,
                decoration: const InputDecoration(
                  label: Text.rich(
                    TextSpan(
                      children: <InlineSpan>[WidgetSpan(child: Text('Nome'))],
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Entre com o nome';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _produtoAmount,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  label: Text.rich(
                    TextSpan(
                      children: <InlineSpan>[
                        WidgetSpan(child: Text('Quantidade')),
                      ],
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Entre com a quantidade';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Quantidade precisa ser um número inteiro';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _produtoPrice,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: const InputDecoration(
                  label: Text.rich(
                    TextSpan(
                      children: <InlineSpan>[WidgetSpan(child: Text('Preço'))],
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Entre com o preço';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Preço inválido';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final int amount = int.parse(_produtoAmount.text);
                    final double price = double.parse(_produtoPrice.text);

                    Product produto = Product(
                      id: widget.product?.id,
                      name: _produtoName.text,
                      amount: amount,
                      price: price,
                      buyed: widget.product?.buyed ?? false,
                    );

                    if (widget.product == null) {
                      int id = await Productdao.instance.add(produto);
                      produto.id = id;
                    } else {
                      widget.product!.name = _produtoName.text;
                      widget.product!.amount = amount;
                      widget.product!.price = price;
                      await Productdao.instance.update(widget.product!);
                    }

                    if (!context.mounted) {
                      return;
                    }

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Salvando produto")),
                    );
                    Navigator.pop(context);
                  }
                },
                child: const Text("salvar"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
