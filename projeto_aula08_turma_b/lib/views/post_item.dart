import 'package:flutter/material.dart';
import 'package:projeto_aula08_turma_b/database/postdao.dart';
import 'package:projeto_aula08_turma_b/models/post.dart';
import 'package:projeto_aula08_turma_b/views/add_post.dart';

class PostItem extends StatefulWidget {
  final Post post;
  final Function() deleteItem;
  const PostItem({super.key, required this.post, required this.deleteItem});

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsGeometry.all(8),
      child: ListTile(
        leading: widget.post.liked
            ? const Icon(Icons.favorite)
            : const Icon(Icons.favorite_border),
        tileColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text(widget.post.title),
        titleTextStyle: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        subtitle: Text(widget.post.text),
        onTap: () {
          setState(() {
            widget.post.like();
          });
          Postdao.instance.update(widget.post);
        },
        trailing: Wrap(
          children: [
            IconButton(
              onPressed: () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddPost(post: widget.post),
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
