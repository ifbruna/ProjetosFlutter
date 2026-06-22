import 'package:flutter/material.dart';
import 'package:projeto_aula08_turma_b/models/post.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _postController = TextEditingController();
  final TextEditingController _postControllerr = TextEditingController();

  @override
  void dispose() {
    _postController.dispose();
    _postControllerr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Novo post"),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsetsGeometry.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _postControllerr,
                decoration: const InputDecoration(
                  label: Text.rich(
                    TextSpan(
                      children: <InlineSpan>[WidgetSpan(child: Text('Titulo'))],
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Entre com seu post';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _postController,
                decoration: const InputDecoration(
                  label: Text.rich(
                    TextSpan(
                      children: <InlineSpan>[WidgetSpan(child: Text('Texto'))],
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Entre com seu post';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(const SnackBar(content: Text('salvando')));
                    Navigator.pop(context, [
                      Post(
                        title: _postControllerr.text,
                        text: _postController.text,
                      ),
                    ]);
                  }
                },
                child: const Text('salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
