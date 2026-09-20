import 'package:flutter/material.dart';
import 'package:projeto_aula08_turma_b/models/comment.dart';

class CommentItem extends StatelessWidget {
  final Comment comment;
  const CommentItem({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8), // <-- corrigido
      child: ListTile(
        leading: const Icon(Icons.account_circle),
        tileColor: Theme.of(context).colorScheme.primaryContainer,
        title: Text(comment.text),
      ),
    );
  }
}
