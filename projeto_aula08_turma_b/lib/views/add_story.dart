import 'package:flutter/material.dart';
import 'package:projeto_aula08_turma_b/models/story.dart';

class AddStory extends StatefulWidget {
  const AddStory({super.key});

  @override
  State<AddStory> createState() => _AddStoryState();
}

class _AddStoryState extends State<AddStory> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _storyController = TextEditingController();
  final TextEditingController _storyControllerr = TextEditingController();

  @override
  void dispose() {
    _storyControllerr.dispose();
    _storyController.dispose();
    super.dispose();
  }

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
                decoration: const InputDecoration(
                  label: Text.rich(
                    TextSpan(
                      children: <InlineSpan>[WidgetSpan(child: Text('User'))],
                    ),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Entre com seu story';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _storyController,
                decoration: const InputDecoration(
                  label: Text.rich(
                    TextSpan(
                      children: <InlineSpan>[WidgetSpan(child: Text('Titulo'))],
                    ),
                  ),
                ),
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
