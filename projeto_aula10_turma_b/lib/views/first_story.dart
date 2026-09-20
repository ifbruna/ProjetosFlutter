import 'package:flutter/material.dart';
import 'package:projeto_aula08_turma_b/database/storydao.dart';
import 'package:projeto_aula08_turma_b/models/story.dart';
import 'package:projeto_aula08_turma_b/views/add_story.dart';

class FirstStory extends StatefulWidget {
  final Story story;
  final Function() deleteItem;
  final Function() onStoryUpdated; // avisa quando editar/adicionar

  const FirstStory({
    super.key,
    required this.story,
    required this.deleteItem,
    required this.onStoryUpdated,
  });

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
            onTap: () {
              // igual StoryItem
              setState(() {
                widget.story.vizu();
              });
              Storydao.instance.update(widget.story);
            },
            onLongPress: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Wrap(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.edit),
                        title: const Text('Editar'),
                        onTap: () async {
                          Navigator.pop(context);
                          await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  AddStory(story: widget.story),
                            ),
                          );
                          widget.onStoryUpdated();
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.delete),
                        title: const Text('Excluir'),
                        onTap: () {
                          Navigator.pop(context);
                          widget.deleteItem();
                        },
                      ),
                    ],
                  );
                },
              );
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
                // botão que diferencia um pouco do storyitem
                GestureDetector(
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AddStory()),
                    );
                    widget.onStoryUpdated();
                  },
                  child: const Icon(Icons.add_circle),
                ),
              ],
            ),
          ),
          Text(widget.story.user, style: const TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
