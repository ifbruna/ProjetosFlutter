import 'package:flutter/material.dart';
import 'package:projeto_aula08_turma_b/database/commentdao.dart';
import 'package:projeto_aula08_turma_b/database/postdao.dart';
import 'package:projeto_aula08_turma_b/models/comment.dart';
import 'package:projeto_aula08_turma_b/models/post.dart';
import 'package:projeto_aula08_turma_b/views/post_item.dart';

class AddComment extends StatefulWidget {
  const AddComment({super.key});

  @override
  State<AddComment> createState() => _AddCommentState();
}

class _AddCommentState extends State<AddComment> {
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
      body: Column(
        children: [
          SizedBox(
            height: 150,
            child: Stack(
              children: [
                FutureBuilder(
                  future: Postdao().getPosts(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return snapshot.data!.isEmpty
                          ? const Center(child: Text("Nenhum Post"))
                          : ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                Post currentPost = snapshot.data![index];
                                return PostItem(post: currentPost);
                              },
                            );
                    } else if (snapshot.hasError) {
                      return Center(child: Text(snapshot.error.toString()));
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
                FutureBuilder(
                  future: Commentdao().getCommentsByPost(postId),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return snapshot.data!.isEmpty
                          ? const Center(child: Text('Nenhum comentário'))
                          : ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                Comment currentComment = snapshot.data![index];
                                return CommentItem(
                                  comment: currentComment,
                                ); //criar o view comment_item.dart
                              },
                            );
                    } else if (snapshot.hasError) {
                      return Center(child: Text(snapshot.error.toString()));
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
