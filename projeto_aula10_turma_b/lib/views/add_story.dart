import 'package:flutter/material.dart';
import 'package:projeto_aula08_turma_b/database/storydao.dart';
import 'package:projeto_aula08_turma_b/models/story.dart';

class AddStory extends StatefulWidget {
  final Story? story;

  const AddStory({super.key, this.story});

  @override
  State<AddStory> createState() => _AddStoryState();
}

class _AddStoryState extends State<AddStory> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _storyController = TextEditingController();
  final TextEditingController _storyControllerr = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.story != null) {
      _storyControllerr.text = widget.story!.user;
      _storyController.text = widget.story!.text;
    }
  }

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
        title: widget.story == null
            ? const Text("Novo story")
            : const Text('Alterando o story'),
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
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    Story novoStory = Story(
                      user: _storyControllerr.text,
                      text: _storyController.text,
                    );

                    if (widget.story == null) {
                      int id = await Storydao.instance.add(novoStory);
                      novoStory.id = id;
                    } else {
                      widget.story!.user = _storyControllerr.text;
                      widget.story!.text = _storyController.text;
                      Storydao.instance.update(widget.story!);
                    }

                    if (!context.mounted) {
                      //kki faz?
                      return;
                    }

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Salvando story")),
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
