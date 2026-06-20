import 'package:flutter/material.dart';
import 'package:projeto_aula08_turma_b/models/post.dart';
import 'package:projeto_aula08_turma_b/models/story.dart';
import 'package:projeto_aula08_turma_b/views/add_post.dart';
import 'package:projeto_aula08_turma_b/views/first_story.dart';
import 'package:projeto_aula08_turma_b/views/post_item.dart';
import 'package:projeto_aula08_turma_b/views/story_item.dart';

class HomePage extends StatefulWidget {
   const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List _posts = [Post(title:'aula', text:'auauauau'), 
                      Post(title:'aula2', text:'auauauau'), 
                      Post(title:'aula3', text:'auauauau'),
                      Post(title:'aula4', text:'auauauau'), 
                      Post(title:'aula5', text:'auauauau') ];

  final List _stories = [
                        Story(user: 'bruninha_grau', text: 'story1'),
                        Story(user: 'sergio_do_grau', text: 'story2'),
                        Story(user: 'lari_do_grau', text: 'story3'),
                        Story(user: 'graugraugrau', text: 'story4'),
                        ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instagram'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),

    floatingActionButton: FloatingActionButton(
      onPressed: () async {
        final result = await Navigator.push(context,
          MaterialPageRoute(builder: (context) => const AddPost()));
        if (result != null) {
          setState(() {
            _posts.add(result[0]);
          });
        }
      },
      child: const Icon(Icons.add)),


    body: Column(
      children: [
        SizedBox(
          height: 150,
          child: Stack(
            children: [
               ListView.builder(
              itemCount: _stories.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
              if (index == 0) {
              return FirstStory(story: _stories[index], onAddStory: (Story story) {
            setState(() {
          _stories.add(story);
          });}
          );
              }
              return StoryItem(story: _stories[index]);
            },
          ),
          ],
          )
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _posts.length,
            itemBuilder: (context, index) {
              return PostItem(post: _posts[index]);
            }
          ),
        ),

        

      ],
    ),

    );
  }
}