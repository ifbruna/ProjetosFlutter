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
      padding: const EdgeInsetsGeometry.all(8),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                widget.story.vizu();
              });
            },
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inversePrimary,
                shape: BoxShape.circle,
                border: Border.all(
                  width: 3,
                  color: (widget.story.vizualizado)
                      ? Theme.of(context).colorScheme.inversePrimary
                      : Theme.of(context).colorScheme.secondary,
                ),
              ),
              child: Center(
                child: Text(
                  widget.story.text,
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
          Text(widget.story.user, style: const TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
