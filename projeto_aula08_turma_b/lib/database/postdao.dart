import 'package:projeto_aula08_turma_b/database/database_helper.dart';
import 'package:projeto_aula08_turma_b/models/post.dart';
import 'package:sqflite/sqflite.dart';

class Postdao {
  Postdao._();
  static final Postdao instance = Postdao._();

  // read
  Future<List<Post>> getPosts() async {
    Database db = await DatabaseHelper.instance.database;
    var posts = await db.query('posts', orderBy: 'id ASC');
    List<Post> postList = posts.isNotEmpty
        ? posts.map((item) => Post.fromMap(item)).toList()
        : [];
    return postList;
  }

  // create
  Future<int> add(Post newPost) async {
    Database db = await DatabaseHelper.instance.database;
    return await db.insert('posts', newPost.toMap());
  }

  // delete
  Future<int> remove(Post post) async {
    Database db = await DatabaseHelper.instance.database;
    return await db.delete('posts', where: 'id=?', whereArgs: [post.id]);
  }

  // update
  Future<int> update(Post post) async {
    Database db = await DatabaseHelper.instance.database;
    return await db.update(
      'posts',
      post.toMap(),
      where: 'id=?',
      whereArgs: [post.id],
    );
  }
}
