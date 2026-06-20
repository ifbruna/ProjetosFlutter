import 'package:flutter/material.dart';
import 'package:projeto_aula08_turma_b/models/story.dart';
import 'package:projeto_aula08_turma_b/views/add_story.dart';

class FirstStory extends StatefulWidget {
  final Story story;
  final Function onAddStory;

  const FirstStory({super.key, required this.story, required this.onAddStory});

  @override
  State<FirstStory> createState() => _FirstStoryState();
}

class _FirstStoryState extends State<FirstStory> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          GestureDetector(
            onTap: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddStory()),
              );
              if (result != null) {
                widget.onAddStory(result[0]);
              }
            },
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.inversePrimary,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      widget.story.text,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                const Icon(Icons.add_circle),
              ],
            ),
          ),
          Text(widget.story.user, style: const TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
