import 'package:flutter/material.dart';
import 'package:projeto_aula08_turma_b/views/post_item.dart';
import 'package:projeto_aula08_turma_b/views/story_item.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});
  final List _posts = ['post 1', 'post 2', 'post 3', 'post 4', 'post 5'];
  final List _stories = ['storie 1', 'storie 2', 'storie 3', 'storie 4', 'storie 5'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instagram'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      
    body: Column(
      children: [
        SizedBox(
          height: 150,
          child: ListView.builder(
            itemCount: _stories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return StoryItem(text: _stories[index]);
            }
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _posts.length,
            itemBuilder: (context, index) {
              return PostItem(text: _posts[index],);
            }
          ),
        ),

        

      ],
    ),

    );
  }
}