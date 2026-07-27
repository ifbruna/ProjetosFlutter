import 'package:projeto_aula08_turma_b/database/database_helper.dart';
import 'package:projeto_aula08_turma_b/models/post.dart';
import 'package:sqflite/sqflite.dart';

class Postdao {
  Postdao._();
  static final Postdao instance = Postdao._();

  Future<List<Post>> getPosts() async {
    Database db = await DatabaseHelper.instance.database;
    var posts = await db.query('posts', orderBy: 'id DESC');
    List<Post> postList = posts.isNotEmpty
        ? posts.map((item) => Post.fromMap(item)).toList()
        : [];
    return postList;
  }
}
