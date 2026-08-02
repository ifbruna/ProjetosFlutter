import 'package:flutter/material.dart';
import 'package:projeto_aula08_turma_b/database/postdao.dart';
import 'package:projeto_aula08_turma_b/database/storydao.dart';
import 'package:projeto_aula08_turma_b/models/post.dart';
import 'package:projeto_aula08_turma_b/models/story.dart';
import 'package:projeto_aula08_turma_b/views/add_post.dart';
import 'package:projeto_aula08_turma_b/views/add_story.dart';
import 'package:projeto_aula08_turma_b/views/first_story.dart';
import 'package:projeto_aula08_turma_b/views/post_item.dart';
import 'package:projeto_aula08_turma_b/views/story_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void deletePost(Post post) {
    setState(() {
      Postdao.instance.remove(post);
    });
  }

  void deleteStory(Story story) {
    setState(() {
      Storydao.instance.remove(story);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instagram'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Wrap(
                children: [
                  ListTile(
                    leading: const Icon(Icons.image),
                    title: const Text('Novo post'),
                    onTap: () async {
                      Navigator.pop(context); // fecha o menu
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddPost(),
                        ),
                      );
                      setState(() {});
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.camera_alt),
                    title: const Text('Novo story'),
                    onTap: () async {
                      Navigator.pop(context); // fecha o menu
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AddStory(),
                        ),
                      );
                      setState(() {});
                    },
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),

      body: Column(
        children: [
          SizedBox(
            height: 150,
            child: Stack(
              children: [
                FutureBuilder(
                  future: Storydao.instance.getStorys(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return snapshot.data!.isEmpty
                          ? const Center(child: Text("Nenhum Story"))
                          : ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                Story currentStory = snapshot.data![index];

                                if (index == 0) {
                                  return FirstStory(
                                    story: currentStory,
                                    deleteItem: () => deleteStory(currentStory),
                                    onStoryUpdated: () {
                                      setState(() {});
                                    },
                                  );
                                }
                                return StoryItem(
                                  story: currentStory,
                                  deleteItem: () => deleteStory(currentStory),
                                  onStoryUpdated: () {
                                    setState(() {});
                                  },
                                );
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
          Expanded(
            child: FutureBuilder(
              future: Postdao.instance.getPosts(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return snapshot.data!.isEmpty
                      ? const Center(child: Text("Nenhum Post"))
                      : ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            Post currentPost = snapshot.data![index];
                            return PostItem(
                              post: currentPost,
                              deleteItem: () => deletePost(currentPost),
                            );
                          },
                        );
                } else if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else {
                  return const CircularProgressIndicator();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
