import 'package:flutter/material.dart';
import 'package:projeto_aula08_turma_b/views/story_item.dart';
import 'package:projeto_aula08_turma_b/models/story.dart';

class FirstStory extends StatefulWidget {
  const FirstStory({super.key});

  @override
  State<FirstStory> createState() => _FirstStoryState();
}

final List _stories = [Story(user: 'bruninha_grau', text: 'story1')]

class _FirstStoryState extends State<FirstStory> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(8),
      child:  Column(
      children: [
      SizedBox(
      height: 150,
      child: Stack(
        children: [
          StoryItem(story: _stories[index]),
          Icon(Icons.add_circle),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Icon(Icons.add_circle),
            ),
          ), 
        ],
      ),
    ),
  ],
)
    );
  }
}