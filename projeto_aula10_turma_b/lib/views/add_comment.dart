import 'package:flutter/material.dart';
import 'package:projeto_aula08_turma_b/database/commentdao.dart';
import 'package:projeto_aula08_turma_b/database/postdao.dart';
import 'package:projeto_aula08_turma_b/models/comment.dart';
import 'package:projeto_aula08_turma_b/models/post.dart';
import 'package:projeto_aula08_turma_b/views/comment_item.dart';
import 'package:projeto_aula08_turma_b/views/post_item.dart';

class AddComment extends StatefulWidget {
  final Post post;
  final Function()? deletePost;
  const AddComment({super.key, required this.post, this.deletePost});

  @override
  State<AddComment> createState() => _AddCommentState();
}

class _AddCommentState extends State<AddComment> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _commentController = TextEditingController();
  List<Comment> _comments = [];

  @override
  void initState() {
    super.initState();
    _loadComments();
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  void _loadComments() async {
    List<Comment> comments = await Commentdao().getCommentsByPost(
      widget.post.id!,
    );
    setState(() {
      _comments = comments;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comentários'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsetsGeometry.all(12),
        child: Column(
          children: [
            PostItem(
              post: widget.post,
              deleteItem: () async {
                await Postdao().remove(widget.post);
                if (!context.mounted) return;
                widget.deletePost?.call();
                Navigator.pop(context);
              },
            ),
            const Divider(),
            Expanded(
              child: _comments.isEmpty
                  ? const Center(child: Text('Nenhum comentário ainda'))
                  : ListView.builder(
                      itemCount: _comments.length,
                      itemBuilder: (context, index) {
                        return CommentItem(comment: _comments[index]);
                      },
                    ),
            ),
            Form(
              key: _formKey,
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _commentController,
                      decoration: const InputDecoration(
                        label: Text('Comentário'),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Entre com seu comentário';
                        }
                        return null;
                      },
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        Comment novoComment = Comment(
                          text: _commentController.text,
                          postId: widget.post.id!,
                        );
                        await Commentdao().add(novoComment);
                        _commentController.clear();
                        _loadComments();
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
