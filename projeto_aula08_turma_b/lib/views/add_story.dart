import 'package:flutter/material.dart';
import 'package:projeto_aula08_turma_b/models/story.dart';

class AddStory extends StatefulWidget {
  const AddStory({super.key});

  @override
  State<AddStory> createState() => _AddStoryState();
}

final _formKey = GlobalKey<FormState>();
final TextEditingController _storyController = TextEditingController();
final TextEditingController _storyControllerr = TextEditingController();

class _AddStoryState extends State<AddStory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Novo story"),
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
                controller: _storyControllerr,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Entre com seu story';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _storyController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Entre com seu story';
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
                      Story(
                        user: _storyControllerr.text,
                        text: _storyController.text,
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
