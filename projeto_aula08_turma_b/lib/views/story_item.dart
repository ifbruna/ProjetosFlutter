import 'package:flutter/material.dart';
import 'package:projeto_aula08_turma_b/models/story.dart';

class StoryItem extends StatefulWidget {

  final Story story;

  const StoryItem({super.key, required this.story});

  @override
  State<StoryItem> createState() => _StoryItemState();
}

class _StoryItemState extends State<StoryItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(8),
      child: Column(
        children: [
          Container(
            height: 100, width: 100,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.inversePrimary,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(widget.story.text, style: TextStyle(fontSize: 20),),
            ),
          ),
           Text(widget.story.user, style: TextStyle(fontSize: 20),)
        ],
      ),
    );
  }
}