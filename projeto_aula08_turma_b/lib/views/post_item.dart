import 'package:flutter/material.dart';
import 'package:projeto_aula08_turma_b/models/post.dart';

class PostItem extends StatefulWidget {
  final Post post;

  const PostItem({super.key, required this.post});

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.all(10),
      child: ListTile(
        title: Text(widget.post.title),
        subtitle: Text(widget.post.text),
        leading: IconButton(
          onPressed: () {
            setState(() {
              widget.post.like();
            });
          },
          icon: Icon(
            widget.post.liked ? Icons.favorite : Icons.favorite_outline,
          ),
        ),
      ),
    );
  }
}
