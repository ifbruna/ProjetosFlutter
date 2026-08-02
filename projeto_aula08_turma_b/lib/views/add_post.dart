import 'package:flutter/material.dart';
import 'package:projeto_aula08_turma_b/database/postdao.dart';
import 'package:projeto_aula08_turma_b/models/post.dart';

class AddPost extends StatefulWidget {
  final Post? post;

  const AddPost({super.key, this.post});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _postController = TextEditingController();
  final TextEditingController _postControllerr = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.post != null) {
      _postControllerr.text = widget.post!.title;
      _postController.text = widget.post!.text;
    }
  }

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
        title: widget.post == null
            ? const Text("Novo post")
            : const Text('Alterando o post'),
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
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    Post novoPost = Post(
                      title: _postControllerr.text,
                      text: _postController.text,
                    );

                    if (widget.post == null) {
                      int id = await Postdao.instance.add(novoPost);
                      novoPost.id = id;
                    } else {
                      widget.post!.title = _postControllerr.text;
                      widget.post!.text = _postController.text;
                      Postdao.instance.update(widget.post!);
                    }

                    if (!context.mounted) {
                      return;
                    }

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Salvando post")),
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
