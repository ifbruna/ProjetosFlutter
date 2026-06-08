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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Novo post"),
        leading: IconButton(icon: const Icon(Icons.close),
        onPressed: () {
          Navigator.pop(context);
          }),
      ),
      body: Padding(padding: const EdgeInsetsGeometry.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _postController,
                validator: (value){
                  if(value == null || value.isEmpty){
                    return 'Entre com seu post';
                  }
                  return null;
                },
              ),
              ElevatedButton(onPressed: () {
                if(_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('salvando')));
                    Navigator.pop(context, [Post(title: _postControllerr.text, text: _postController.text)]);
                }
              }, child: const Text('salvar')),
            ],),),),);
  }
}