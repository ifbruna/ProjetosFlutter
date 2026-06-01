import 'package:flutter/material.dart';

class AddPost extends StatefulWidget {
  const AddPost({super.key});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {

final _formKey = GlobalKey<FormState>();
final TextEditingController _postController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}